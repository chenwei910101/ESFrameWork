//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "ESNewViewController.h"
#import "UIBarButtonItem+EGExtention.h"
@interface ESNewViewController ()

@end

@implementation ESNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新帖";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(mainTagSubClick)];
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [button setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    //    [button setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    //    [button sizeToFit];
    //    [button addTarget:self action:@selector(mainTagSubClick) forControlEvents:UIControlEventTouchUpInside];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

- (void)mainTagSubClick {
    
}

@end
