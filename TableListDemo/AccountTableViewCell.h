//
//  AccountTableViewCell.h
//  TableListDemo
//
//  Created by albeeert on 10/8/16.
//  Copyright © 2016 albeeert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountTableViewCell : UITableViewCell

/**
 *  头像
 */
@property (nonatomic, strong) UIImageView *avatar;

/**
 *  账号
 */
@property (nonatomic, strong) UILabel *account;

@end
