//
//  SalesListViewController.m
//  MobileBikeAuction
//
//  Created by Skywalker on 2/9/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import "SalesListViewController.h"

@interface SalesListViewController ()

@end

@implementation SalesListViewController

@synthesize bannerViewController = _bannerViewController;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _bannerViewController = [GADMasterViewController genAdViewUnderView:self.view];
    [_bannerViewController resetAdView:self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"我要看車";
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- AdMob Related
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Ad Received");
    [UIView animateWithDuration:1.0 animations:^{
        adView.frame = CGRectMake(0.0,
                                  self.view.frame.size.height - GAD_SIZE_320x50.height,
                                  adView.frame.size.width, adView.frame.size.height);
    }];
}

@end
