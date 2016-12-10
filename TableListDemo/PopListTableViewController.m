//
//  PopListTableViewController.m
//  TableListDemo
//
//  Created by albeeert on 10/8/16.
//  Copyright © 2016 albeeert. All rights reserved.
//

#import "PopListTableViewController.h"
#import "AccountTableViewCell.h"
#import "Account.h"

#define inputW 230 // 输入框宽度
#define inputH 35  // 输入框高度

@implementation PopListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景
    self.view.backgroundColor = [UIColor whiteColor];
    // 清除多余的分割线
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    //  边界
    self.tableView.layer.borderWidth = 0.5;
    // 默认关闭下拉列表
    _isOpen = NO;
}

// 分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 每个分区cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 展开与隐藏账号列表
    if(_isOpen)
        return _accountSource.count;
    else
        return 0;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *specialId = @"id";
    AccountTableViewCell *cell = [[AccountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:specialId];
    // 添加数据源
    Account *acc = _accountSource[indexPath.row];
    cell.avatar.image = [UIImage imageNamed:acc.avatar];// 头像
    cell.account.text = acc.account;// 账号
    [cell setBackgroundColor:[UIColor whiteColor]];
    //分割线清偏移
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
        
    }
    return cell;
}

// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return inputH;
}

// cell选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 通知代理
    [_delegate selectedCell:indexPath.row];
}

// 打开cell滑动编辑
- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 删除按钮的显示文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

// cell删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_accountSource removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        // 通知代理更新下拉菜单高度
        [_delegate updateListH];
    }
}

@end
