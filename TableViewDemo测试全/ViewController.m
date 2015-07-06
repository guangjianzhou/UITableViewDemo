//
//  ViewController.m
//  TableViewDemo测试全
//
//  Created by zhougj on 15/7/6.
//  Copyright (c) 2015年 iiseeuu. All rights reserved.
//


/**
 *  测试内容                                                结果
 *  1.直接设置cell中button的隐藏，是否直接在界面显示          直接设置隐藏即可显示，不用刷新cell
 *  2.用系统的cell 进行cellforRow
 *
 *
 *
 *
 */

#import "ViewController.h"
#import "CustomCell.h"

#define kCellIdentifier @"cellIdentifier"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL selectStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        _dataArray = [NSMutableArray arrayWithObjects:@"一去二三里",
                                                      @"烟村四五家",
                                                      @"亭台六七座",
                                                      @"八九十枝花",
                      nil];
        _selectStatus = NO;
    }
    
    {
        self.tableView.tableFooterView = [UIView new];
    }
}


#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self setUpCodeCell:tableView cellForRowAtIndexPath:indexPath];
  
}

- (UITableViewCell *)setUpCodeCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}


//storyboard Cell
- (UITableViewCell *)setUpSystemCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.viewwithTag 值为nil
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier ];
    
    //2.viewwithTag 可以找到label
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:1];
    titleLabel.text = _dataArray[indexPath.row];
    UIButton *btn = (UIButton *)[cell.contentView viewWithTag:3];
    btn.backgroundColor = ((indexPath.row %2 == 0)?[UIColor brownColor]:[UIColor yellowColor]);
    return cell;
}


//自定义
- (UITableViewCell *)setUpCustomCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.titleLabel.text = _dataArray[indexPath.row];
    NSInteger image = (arc4random() %4) + 1;
    NSString *imageStr = [NSString stringWithFormat:@"%li.png",(long)image];
    cell.imageView.image = [UIImage imageNamed:imageStr];
    return cell;
}


#pragma mark - UITableViewDelegate






#pragma mark - ButtonAction
- (IBAction)begin:(id)sender
{
    if (_selectStatus)
    {
        NSArray *visibleCell = [self.tableView visibleCells];
        for (CustomCell *cell in visibleCell)
        {
            cell.btn.hidden = YES;
        }
    }
    else
    {
        NSArray *visibleCell = [self.tableView visibleCells];
        for (CustomCell *cell in visibleCell)
        {
            cell.btn.hidden = NO;
        }
    }
    _selectStatus = !_selectStatus;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
