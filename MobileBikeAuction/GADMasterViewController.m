//
//  GADMasterViewController.m
//  MobileBikeAuction
//
//  Created by Skywalker on 2/9/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import "GADMasterViewController.h"

#define AdMob_ID @"a152f5fce0a5c1d"

@interface GADMasterViewController ()

@end

@implementation GADMasterViewController

@synthesize adBannerView = _adBannerView;
@synthesize didCloseWebsiteView = _didCloseWebsiteView;
@synthesize isLoaded = _isLoaded;
@synthesize currentDelegate = _currentDelegate;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(GADMasterViewController *)genAdViewUnderView:(UIView *)contentView {
    static dispatch_once_t pred;
    static GADMasterViewController *shared;
    
    dispatch_once(&pred, ^{
        shared = [[GADMasterViewController alloc] initUnderView:contentView];
    });
    
    return shared;
}

-(id)initUnderView:(UIView *)contentView {
    if (self = [super init]) {
        NSLog(@"Content View Height: %f", contentView.frame.size.height);
        _adBannerView = [[GADBannerView alloc]
        initWithFrame:CGRectMake(0.0,
                                 contentView.frame.size.height - GAD_SIZE_320x50.height,
                                 GAD_SIZE_320x50.width,
                                 GAD_SIZE_320x50.height)];
        _isLoaded = NO;
    }
    return self;
                         
}

-(void)resetAdView:(UIViewController *)rootViewController {
    // Always keep track of the current delegate for notification forwarding
    _currentDelegate = rootViewController;
    
    // Ad already requested; simply add it into the view
    if (_isLoaded) {
        [rootViewController.view addSubview:_adBannerView];
    }
    else {
        _adBannerView.delegate = self;
        _adBannerView.rootViewController = rootViewController;
        _adBannerView.adUnitID = AdMob_ID;
        [_adBannerView loadRequest:[self createRequest]];
        [rootViewController.view addSubview:_adBannerView];
        _isLoaded = YES;
    }
}

- (GADRequest *)createRequest
{
    GADRequest *request = [GADRequest request];
    request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID, nil];
    return request;
}

- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Ad Received");
    if (_isLoaded) {
        [_currentDelegate adViewDidReceiveAd:adView];
    }
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive add due to %@", [error localizedFailureReason]);
}

@end
