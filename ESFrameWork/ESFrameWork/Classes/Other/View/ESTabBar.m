//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.
#import "ESTabBar.h"
@interface ESTabBar ()
@property (nonatomic, weak) UIButton *publishButton;
@end
@implementation ESTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *publishButton = [[UIButton alloc] init];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        
        [publishButton sizeToFit];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
        
    }
    
    return self;
}

// 设置TabBar的尺寸
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    self.publishButton.center = CGPointMake(W * 0.5, H * 0.5);
    
    // 按钮的尺寸
    CGFloat btnW = W / 5;
    CGFloat btnH = H ;
    CGFloat btnY = 0;
    
    // 按钮的索引
    int index = 0;
    for (UIView *tarbarButton in self.subviews) {
        NSString *className = NSStringFromClass(tarbarButton.class);
        if (![className isEqualToString:@"UITabBarButton"])  continue;
        
        CGFloat btnX = index * btnW;
        if (index >= 2) {
            btnX += btnW;
        }
        tarbarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        index++;
    }
}

@end
