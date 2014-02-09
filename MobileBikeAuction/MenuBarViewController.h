//
//  MenuBarViewController.h
//  MobileBikeAuction
//
//  Created by Skywalker on 2/8/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADMasterViewController.h"
#import "SalesListViewController.h"
#import "SellFormViewController.h"

@class GADBannerView;

@interface MenuBarViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_menuListItems;
    UITableView *_menuListTable;
    GADMasterViewController *_bannerViewController;
}

@property (strong, nonatomic) NSMutableArray *menuListItems;
@property (strong, nonatomic) IBOutlet UITableView *menuListTable;
@property (strong, nonatomic) GADMasterViewController *bannerViewController;

@end
