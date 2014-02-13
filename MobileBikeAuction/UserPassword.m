//
//  UserPassword.m
//  MobileBikeAuction
//
//  Created by 姚威羽 on 2014/2/13.
//  Copyright (c) 2014年 Fincosoft Co. All rights reserved.
//

#import "UserPassword.h"

@interface UserPassword ()

@end

@implementation UserPassword

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIAlertView*alertview = [[UIAlertView alloc]
                             initWithTitle:@"請輸入帳號密碼" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登入",nil
                             
                             ];
    alertview.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertview show];

}

-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"使用者取消輸入");
            break;
        case 1:
        {
            UITextField*uidTextField = [alertView textFieldAtIndex:0];
            UITextField*pwdTextField = [alertView
                                        textFieldAtIndex:1];
            
            NSLog(@"輸入的帳號：％＠,密碼：％＠",uidTextField.text,pwdTextField.text);
            break;
        }
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
