//
//  ViewController.m
//  UITableView
//
//  Created by hao on 17/9/13.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "MJExtension.h"
#import "YHWine.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UILabel *sumPrice;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController
-(NSArray *)wineArray{
    if (!_wineArray) {
        _wineArray = [YHWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"wineArray:%@",self.wineArray);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSumPrice:) name:@"plusClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(minusSumPrice:) name:@"minusClick" object:nil];
    
    NSArray *names = [self.wineArray valueForKeyPath:@"name"];
    NSLog(@"names:%@",names);
    
    
}
-(void)changeSumPrice:(NSNotification *)info{
    CustomTableViewCell *cell = (CustomTableViewCell *)info.object;
    NSLog(@"%d-----%d",cell.wine.money.intValue,self.sumPrice.text.intValue);
    int totalPrice = self.sumPrice.text.intValue + cell.wine.money.intValue;
    
    self.sumPrice.text = [NSString stringWithFormat:@"%d",totalPrice];
}
-(void)minusSumPrice:(NSNotification *)info{
    CustomTableViewCell *cell = (CustomTableViewCell *)info.object;
    NSLog(@"%d-----%d",cell.wine.money.intValue,self.sumPrice.text.intValue);
    int totalPrice =self.sumPrice.text.intValue - cell.wine.money.intValue;
    
    self.sumPrice.text = [NSString stringWithFormat:@"%d",totalPrice];

}
- (IBAction)clear:(id)sender {
    for (YHWine *wine in self.wineArray) {
        wine.count = 0;
    }
    
    self.sumPrice.text = @"0";
    
    [self.tableView reloadData];
}

-(void)test:(id)press and:(id)twopross{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test:nil and:nil];
}
//-touch
#pragma mark -- tableViewData
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cellid";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
