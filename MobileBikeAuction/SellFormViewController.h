//
//  SellFormViewController.h
//  MobileBikeAuction
//
//  Created by Skywalker on 2/9/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADMasterViewController.h"

@interface SellFormViewController : UIViewController
{
    GADMasterViewController *_bannerViewController;
}

@property (strong, nonatomic) GADMasterViewController *bannerViewController;

@end