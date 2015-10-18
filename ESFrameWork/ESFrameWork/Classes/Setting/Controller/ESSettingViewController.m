//
//
//  EGFrameWork
//
//  Created by Esirnus on 15/10/18.
//  Copyright © 2015年 Esirnus. All rights reserved.

#import "ESSettingViewController.h"

@interface ESSettingViewController ()

@end

@implementation ESSettingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Setting-%zd",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建箭头所指向的控制器
    UIViewController *vc = [UIStoryboard storyboardWithName:@"TestBackView" bundle:nil].instantiateInitialViewController;
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
