//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "UIBarButtonItem+EGExtention.h"


@implementation UIBarButtonItem (ESExtension)
/**
 *  抽取此处代码有三种方式
 *  继承:不采用
 *  新建一个类:不采用
 *  分类:符合苹果的内部的做法,清晰明确
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
}
@end
