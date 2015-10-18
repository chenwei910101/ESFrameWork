//
//  ESNavigationController.m
//  EGFrameWork
//
//  Created by 陈晓飞 on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.
//

#import "ESNavigationController.h"

@interface ESNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ESNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置pop手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
}
/**
 *  重写这个方法的目的:为了拦截整个push的过程,拿到所有push进来的子控制器
 *
 *  @param viewController 当前push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // if (viewControllers != 栈底控制器)
    if (self.viewControllers.count > 0) {
        // 当push这个子控制器的时候,就隐藏这个底部工具条
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        backButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
    }
    [super pushViewController:viewController animated:YES];
    
}
- (void)back {
    [self popViewControllerAnimated:YES];
}
#pragma make <UIGestureRecognizerDelegate>
// return YES  pop手势有效    return NO  无效
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //    if (self.viewControllers.count == 1) return NO;
    //    return YES;
    return self.viewControllers.count > 1;
    
}


@end


