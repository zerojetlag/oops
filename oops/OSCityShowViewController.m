//
//  OSCityShowViewController.m
//  oops
//
//  Created by sean on 15-4-1.
//  Copyright (c) 2015年 sean. All rights reserved.
//

#import "OSCityShowViewController.h"
#import "City.h"
#import "AppDelegate.h"

@interface OSCityShowViewController ()

@end

@implementation OSCityShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    City *thisCity = delegate.cities[index.row];
    self.title = thisCity.cityName;
    descriptionView.text = thisCity.cityDescription;
    descriptionView.enabled = NO;
    pictureView.image = thisCity.cityPicture;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithIndexPath: (NSIndexPath *)indexPath{
    if (self = [super init]) {
        index = indexPath;
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
