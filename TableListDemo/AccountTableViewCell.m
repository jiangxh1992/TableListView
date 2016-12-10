//
//  AccountTableViewCell.m
//  TableListDemo
//
//  Created by albeeert on 10/8/16.
//  Copyright © 2016 albeeert. All rights reserved.
//

#import "AccountTableViewCell.h"

#define inputW 230 // 输入框宽度
#define inputH 35  // 输入框高度

@implementation AccountTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 头像
        _avatar = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, inputH-10, inputH-10)];
        _avatar.layer.cornerRadius = (inputH-10)/2;
        [self.contentView addSubview:_avatar];
        
        // 账号
        _account = [[UILabel alloc]initWithFrame:CGRectMake(inputH, 0, inputW - inputH, inputH)];
        _account.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_account];
    }
    return self;
}

@end
