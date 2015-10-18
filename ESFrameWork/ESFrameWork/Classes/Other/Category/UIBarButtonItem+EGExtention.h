//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (EGExtention)
/*
 抽取一个方法,用于设置UIBarButtonItem的样式和点击事件
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
