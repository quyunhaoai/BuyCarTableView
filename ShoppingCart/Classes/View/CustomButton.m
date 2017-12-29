//
//  CustomButton.m
//  UITableView
//
//  Created by hao on 17/9/13.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}
@end
