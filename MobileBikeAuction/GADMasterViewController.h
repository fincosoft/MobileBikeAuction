//
//  GADMasterViewController.h
//  MobileBikeAuction
//
//  Created by Skywalker on 2/9/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "GADRequest.h";

@class GADBannerView;

@interface GADMasterViewController : UIViewController  <GADBannerViewDelegate> {
    GADBannerView *_adBannerView;
    BOOL _didCloseWebsiteView;
    BOOL _isLoaded;
    id _currentDelegate;
}

@property (nonatomic, strong) GADBannerView *adBannerView;
@property (nonatomic) BOOL didCloseWebsiteView;
@property (nonatomic) BOOL isLoaded;
@property (nonatomic, strong) id currentDelegate;

+(GADMasterViewController *)genAdViewUnderView:(UIView *)contentView ;
-(void)resetAdView:(UIViewController *)rootViewController;
-(id)initUnderView:(UIView *)contentView;

@end
