//
//  CustomTableViewCell.m
//  UITableView
//
//  Created by hao on 17/9/13.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "YHWine.h"
#import "MJExtension.h"
#import "CustomButton.h"
@interface CustomTableViewCell()
{
    
}
@property (weak, nonatomic) IBOutlet CustomButton *minusButton;
@property (weak, nonatomic) IBOutlet CustomButton *jiahao;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic, assign) BOOL ISNOW;
@end;

@implementation CustomTableViewCell
-(void)setWine:(YHWine *)wine
{
    _wine = wine;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.nameLabel.text = wine.name;
    self.moneyLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    
    self.countLabel.text = [NSString stringWithFormat:@"%ld",wine.count];
    self.minusButton.enabled = (_wine.count > 0) ;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (IBAction)PlusbuttonClick:(id)sender {
    
    self.wine.count ++;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.wine.count];
    
    self.minusButton.enabled = YES;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClick" object:self userInfo:nil];
}

- (IBAction)MinusButtonClick:(id)sender {
    
    self.wine.count --;
     self.countLabel.text = [NSString stringWithFormat:@"%ld",self.wine.count];
    
    if (self.wine.count == 0) {
        self.minusButton.enabled = NO;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClick" object:self userInfo:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
