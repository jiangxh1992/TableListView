//
//  PopListTableViewController.h
//  TableListDemo
//
//  Created by albeeert on 10/8/16.
//  Copyright © 2016 albeeert. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountDelegate <NSObject>

/**
 * 选中cell的代理事件
 */
- (void) selectedCell:(NSInteger)index;

/**
 *  更新下拉菜单的高度
 */
- (void) updateListH;

@end

@interface PopListTableViewController : UITableViewController

/**
 * 是否展开菜单
 */
@property (nonatomic)BOOL isOpen;

/**
 * 账号数据源
 */
@property (nonatomic) NSMutableArray * accountSource;

/**
 * 定义代理
 */
@property (nonatomic, weak) id<AccountDelegate>delegate;

@end
