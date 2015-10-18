
//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "ESMeViewController.h"
#import "UIBarButtonItem+EGExtention.h"
#import "ESSettingViewController.h"
@implementation ESMeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"统一返回键";
    
   
   
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    self.navigationItem.rightBarButtonItem = settingItem;
}


- (void)settingClick {
    ESSettingViewController *setting = [[ESSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}
@end
