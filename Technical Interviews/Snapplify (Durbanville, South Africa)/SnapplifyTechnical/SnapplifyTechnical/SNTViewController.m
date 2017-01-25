//
//  ViewController.m
//  SnapplifyTechnical
//
//  Created by Kurt Jacobs on 2017/01/25.
//  Copyright © 2017 RandomDudes. All rights reserved.
//

#import "SNTViewController.h"
#import "SNTNetworkAPI.h"

@interface SNTViewController ()

@property (nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@end

@implementation SNTViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.locationManager = [CLLocationManager new];
  self.locationManager.delegate = self;
  [self.locationManager requestWhenInUseAuthorization];
  self.temperatureLabel.hidden = YES;
  self.activityIndicator.hidden = YES;
}

- (void)locationDeniedPopup{
  UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Location Error" message:@"Please allow access to location services to use the application." preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
  }];
  UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:nil];
  [controller addAction:okAction];
  [controller addAction:noAction];
  [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)refreshAction:(id)sender {
  self.temperatureLabel.text = @"Updating";
  [self refreshWeatherConditions];
  if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse){
    [self locationDeniedPopup];
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
  }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
  if (status == kCLAuthorizationStatusAuthorizedWhenInUse){
    [self refreshWeatherConditions];
  }
  else if (status == kCLAuthorizationStatusDenied){
    [self locationDeniedPopup];
  }
}

- (void)refreshWeatherConditions{
  [self.locationManager startUpdatingLocation];
  self.activityIndicator.hidden = NO;
  [self.activityIndicator startAnimating];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
  if (locations.firstObject != nil){
    CLLocation *lastLocation = (CLLocation *)locations.firstObject;
    
    __weak typeof (self) weakSelf = self;
    [SNTNetworkAPI getWeatherForLocation:lastLocation andCompletion:^(NSDictionary *jsonData) {
      dispatch_async(dispatch_get_main_queue(), ^{
          weakSelf.temperatureLabel.hidden = NO;
          [weakSelf.activityIndicator stopAnimating];
          weakSelf.activityIndicator.hidden = YES;
          weakSelf.temperatureLabel.text = [NSString stringWithFormat:@"Temperature: %@",jsonData[@"main"][@"temp"]];
      });
    } andFailure:^{
      UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Network Error" message:@"An error occured whilst retrieving the weather." preferredStyle:UIAlertControllerStyleAlert];
      UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
      [controller addAction:okAction];
      [weakSelf presentViewController:controller animated:YES completion:nil];
      weakSelf.temperatureLabel.hidden = YES;
      [weakSelf.activityIndicator stopAnimating];
      weakSelf.activityIndicator.hidden = YES;
    }];
    
    [self.locationManager stopUpdatingLocation];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


@end
