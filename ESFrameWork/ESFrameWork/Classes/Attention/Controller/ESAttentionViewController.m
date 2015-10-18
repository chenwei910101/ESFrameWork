
// 
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "ESAttentionViewController.h"
#import "UIBarButtonItem+EGExtention.h"
#import "ESTestViewController.h"
@interface ESAttentionViewController ()

@end

@implementation ESAttentionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"heart_default" highImage:@"Heart_highed" target:self action:@selector(friendsRecommentClick)];
    
    
    
    
}
- (void)friendsRecommentClick {
    ESTestViewController *test = [[ESTestViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

@end
