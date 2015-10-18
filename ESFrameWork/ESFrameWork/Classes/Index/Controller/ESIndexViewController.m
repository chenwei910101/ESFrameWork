//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "ESIndexViewController.h"
#import "UIBarButtonItem+EGExtention.h"
#import "ESTitleButton.h"
#import "ESTitle1ViewCotroller.h"
#import "ESTitle2ViewCotroller.h"
#import "ESTitle3ViewCotroller.h"
#import "ESTitle4ViewCotroller.h"
#import "ESTitle5ViewCotroller.h"
#import "UIView+EGExtention.h"
@interface ESIndexViewController ()
/**  button   */
@property (nonatomic, weak) ESTitleButton *selectedButton;

@property (nonatomic, weak) UIView *titleIndicatorView;

@property (nonatomic, weak) UIScrollView *scrollView;

/** 存放所有的标题按钮 */
@property (nonatomic, strong) NSMutableArray *titleButtons;
@end

@implementation ESIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置子控制器
    [self setupChildViewControllers];
    // 设置导航栏
    [self setNavgaiton];
    // 设置scrollView
    [self setScrollView];
    // 设置标题栏
    [self setTitleView];
    
    
    
    
    
}

#pragma mark - 懒加载
- (NSMutableArray *)titleButtons
{
    if (!_titleButtons) {
        //        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //
        //        UICollectionView *coll = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:layout];
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

// 设置导航栏
- (void)setNavgaiton {
    self.view.backgroundColor = [UIColor blackColor];
    // 设置标题
    self.navigationItem.title = @"首页";
    // 设置左上角
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(mainTagSubClick)];
}

// 设置scrollView
- (void)setScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor brownColor];
    // 控制控件是否整页翻动
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    // 禁止掉------>scrollView的内边距
    // 默认自动设置scrollView内边距,现在禁止掉
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置内容大小
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.width, 0);
    
    for (int i = 0; i < self.childViewControllers.count; i++ ) {
        //        UITableViewController *vc = self.viewControllers[i];
        
        UITableViewController *vc = self.childViewControllers[i];
        
        vc.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
        
        self.scrollView.scrollIndicatorInsets = vc.tableView.contentInset;
        
        vc.tableView.x = i * scrollView.width;
        vc.tableView.y = 0;
        vc.tableView.width = scrollView.width;
        vc.tableView.height = scrollView.height;
        
        [scrollView addSubview:vc.view];
    }
}

- (void)setupChildViewControllers{
    ESTitle1ViewCotroller *t1 = [[ESTitle1ViewCotroller alloc] init];
    t1.title = @"标题1";
    [self addChildViewController:t1];
    
    ESTitle2ViewCotroller *t2 = [[ESTitle2ViewCotroller alloc] init];
    t2.title = @"标题2";
    [self addChildViewController:t2];
    
    ESTitle3ViewCotroller *t3 = [[ESTitle3ViewCotroller alloc] init];
    t3.title = @"标题3";
    [self addChildViewController:t3];
    
    ESTitle4ViewCotroller *t4 = [[ESTitle4ViewCotroller alloc] init];
    t4.title = @"标题4";
    [self addChildViewController:t4];
    
    ESTitle5ViewCotroller *t5 = [[ESTitle5ViewCotroller alloc] init];
    t5.title = @"标题5";
    [self addChildViewController:t5];
}
// 设置标题栏
- (void)setTitleView {
    // 设置标题栏
    UIView *titleViews = [[UIView alloc] init];
    titleViews.frame = CGRectMake(0, 64, self.view.width, 40);
    titleViews.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.view addSubview:titleViews];
    
    // 设置标题栏中的按钮
    NSUInteger count = self.childViewControllers.count;
    CGFloat titleButtonW = titleViews.width / count;
    CGFloat titleButtonH = titleViews.height;
    
    for (int i = 0; i < count; i ++) {
        ESTitleButton *titlesButton = [[ESTitleButton alloc] init];
        titlesButton.tag = i;
        [titlesButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [titleViews addSubview:titlesButton];
        
        titlesButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        
        [titlesButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal]; // selected no;
        [titlesButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected]; // selected yes;
        
        titlesButton.titleLabel.font  = [UIFont systemFontOfSize:14];
        
        [titlesButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        
    }
    
    // 添加标题按钮底部指示器
    UIView *titleIndicatorView = [[UIView alloc] init];
    [titleViews addSubview:titleIndicatorView];
    
    ESTitleButton *firstButton = titleViews.subviews.firstObject;
    
    // 设置指示器的颜色为被选中按钮的颜色
    titleIndicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    titleIndicatorView.height = 1;
    titleIndicatorView.bottom = titleViews.height;
    
    self.titleIndicatorView = titleIndicatorView;
    // 默认行为 --> 选中firstButton
    // 让被点击的标题按钮变为选中颜色
    firstButton.selected  = YES;
    self.selectedButton = firstButton;
    [firstButton.titleLabel sizeToFit]; // 自动根据当前内容计算尺寸
    // 让指示器移动
    titleIndicatorView.width = firstButton.titleLabel.width;
    titleIndicatorView.centerX = firstButton.centerX;
    
    
}
- (void)mainTagSubClick {
    
}



- (void)titleButtonClick:(ESTitleButton *)titleButton {
    
    // 让当前按钮的状态变为选中前的状态(取消选中)
    self.selectedButton.selected = NO;
    
    titleButton.selected = YES;
    
    self.selectedButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.titleIndicatorView.width = titleButton.titleLabel.width;
        self.titleIndicatorView.centerX = titleButton.centerX;
    }];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark - <UIScrollViewDelegate>
/**
 * 如果通过setContentOffset:animated:让scrollView[进行了滚动动画], 那么最后会在停止滚动时调用这个方法
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 根据scrollView的偏移量的添加子控制器的view
    [self addChildVcView];
}

/**
 *  scrollView停止滚动的时候会调用1次(人为拖拽导致的停止滚动才会触发这个方法)
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 计算按钮索引
    int index = scrollView.contentOffset.x / scrollView.width;
    ESTitleButton *titleButton = self.titleButtons[index];
    // 点击按钮
    [self titleButtonClick:titleButton];
    
    // 根据scrollView的偏移量的添加子控制器的view
    [self addChildVcView];
}

#pragma mark - 其他方法
/**
 *  根据scrollView的偏移量的添加子控制器的view
 */
- (void)addChildVcView
{
    UIScrollView *scrollView = self.scrollView;
    
    // 计算按钮索引
    int index = scrollView.contentOffset.x / scrollView.width;
    
    // 添加对应的子控制器view
    UIViewController *willShowVc = self.childViewControllers[index];
    if (willShowVc.isViewLoaded) return;
    
    [scrollView addSubview:willShowVc.view];
    
    // 设置子控制器view的frame
    willShowVc.view.frame = scrollView.bounds;
}


@end
