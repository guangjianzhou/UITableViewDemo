//
//  CustomCell.m
//  TableViewDemo测试全
//
//  Created by zhougj on 15/7/6.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib
{
    NSLog(@"awakeFromNib---");
    _avarImageView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
