//
//  ESTabBarController.m
//  EGFrameWork
//
//  Created by 陈晓飞 on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.
//
#import "ESTabBarController.h"
#import "ESIndexViewController.h"
#import "ESAttentionViewController.h"
#import "ESSettingViewController.h"
#import "ESNewViewController.h"
#import "ESTabBar.h"
#import "ESMeViewController.h"
#import "ESNavigationController.h"


@interface ESTabBarController ()

@end

@implementation ESTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildController];
    [self setUpItemTextAttrs];
    [self setUpTabBar];
    
}

- (void)setUpTabBar {
    [self setValue:[[ESTabBar alloc] init] forKey:@"tabBar"];
}



- (void)setUpItemTextAttrs {
    // 默认状态的文字
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // 方法或者属性后面有个UI_APPEARANCE_SELECTOR宏,才可以通过appearance对象统一设置
    // 统一设置所有UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    //    [[EGEssenceViewController alloc] init]
}

- (void)setUpChildController {
    
        [self setUpOneChildController:[[ESNavigationController alloc] initWithRootViewController:[[ESIndexViewController alloc] init]] title:@"首页" image:@"tabBar_essence_icon" selectedimg:@"tabBar_essence_click_icon"];
    
        [self setUpOneChildController:[[ESNavigationController alloc] initWithRootViewController:[[ESNewViewController alloc] init]] title:@"新帖" image:@"tabBar_new_icon" selectedimg:@"tabBar_new_click_icon"];
    
    
        [self setUpOneChildController:[[ESNavigationController alloc] initWithRootViewController:[[ESAttentionViewController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedimg:@"tabBar_friendTrends_click_icon"];
    
        [self setUpOneChildController:[[ESNavigationController alloc] initWithRootViewController:[[ESMeViewController alloc] init]] title:@"我" image:@"tabBar_me_icon" selectedimg:@"tabBar_me_click_icon"];
    
}

/**
 *  添加一个子控制器
 *
 *  @param vc            控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)setUpOneChildController :(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedimg:(NSString *)selectedimg {
    vc.view.backgroundColor = [UIColor redColor];
    if (title) {
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedimg];
    }
    [self addChildViewController:vc];
    
}



@end
