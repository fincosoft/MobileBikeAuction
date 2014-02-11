//
//  MenuBarViewController.m
//  MobileBikeAuction
//
//  Created by Skywalker on 2/8/14.
//  Copyright (c) 2014 Fincosoft Co. All rights reserved.
//

#import "MenuBarViewController.h"


@interface MenuBarViewController ()

@end

@implementation MenuBarViewController

@synthesize menuListItems = _menuListItems;
@synthesize menuListTable = _menuListTable;
@synthesize bannerViewController = _bannerViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.menuListItems = [[NSMutableArray alloc] init];
    
    [self.menuListItems addObject:@"我要看車"];
    [self.menuListItems addObject:@"我要賣車"];
    [self.menuListItems addObject:@"我要找車"];
    [self.menuListItems addObject:@"即時通知"];
    [self.menuListItems addObject:@"留言歷史"];
    [self.menuListItems addObject:@"最新成交價格"];
    
    [self.view addSubview:self.menuListTable];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _bannerViewController = [GADMasterViewController genAdViewUnderView:self.view];
    [_bannerViewController resetAdView:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Table View Related Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuListItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.menuListItems objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *nextViewController;
    
    NSLog(@"Selected Index: %ld", (long)indexPath.row);
    
    switch (indexPath.row)
    {
        case 0:
            nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SalesListView"];
            break;
        case 1:
            nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SellFormView"];
            break;
        default:
            //[self performSegueWithIdentifier:@"segue.menu.push" sender:self];
            //nextViewController = [[SalesListViewController alloc] init];
            //nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SalesListView"];
            break;
    }
    [self.navigationController pushViewController:nextViewController animated:YES];
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
