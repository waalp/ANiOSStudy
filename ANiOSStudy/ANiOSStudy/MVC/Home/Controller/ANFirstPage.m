//
//  ANFirstPage.m
//  ANiOSStudy
//
//  Created by Anson on 2017/1/10.
//  Copyright © 2017年 An. All rights reserved.
//

#import "ANFirstPage.h"
#import <UIKit/UIKit.h>
#import "ANHomeVC.h"
@interface ANFirstPage () <UITableViewDataSource, UITableViewDelegate>

/*
 UI
 */
@property (nonatomic, strong) UISearchBar *searchBar;  ///< Search
@property (nonatomic, strong) UITableView *tableView;  ///< TableView
//@property (nonatomic, strong) UIButton *Button;

/*
 Data
 */
@property (nonatomic, strong) NSArray *dataSource;  ///< Data Source
@property (nonatomic, strong) NSArray *ImagedataSource;

@end

@implementation ANFirstPage
//@end
//@interface ViewController:UIViewController<UITableViewDataSource,UITableViewDelegate>{
//    UITableView *tableview;
//    NSArray *array;
//    NSArray *arrayImage;
//    NSArray *arrayImage1;
//}
#pragma mark - View Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = @"首页";
    //    self.tabBarItem.title = @"首页";
    
    [self setData];
    [self setUI];
    [self setConstraints];
    [self loadData];
}

#pragma mark - Public Method

#pragma mark - Action

#pragma mark - Network

#pragma mark - Custom Delegate

#pragma mark - System Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource ? _dataSource.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = _dataSource[indexPath.row];
//    cell.textLabel.frame = CFNotificationCenterGetTypeID();
//    NSString * titleString = [arrayobjectAtIndex:[indexPath row]];
//    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"1234" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
    NSLog(@"%@",cell.textLabel.text);
    return cell;
}

#pragma mark - Private Method

- (void)setData
{
    _dataSource = @[@"seventeenth", @"second", @"third",@"fourth",@"fifth",@"sixth",@"seventh",@"eighth",@"ninth",@"tenth",@"eleventh",@"twelfth",@"thirteenth",@"fourteenth",@"fifteenth",@"sixteenth",@"First"];
}


- (void)setUI
{
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
//    [self.view addSubview:self.Button];
}

- (void)setConstraints
{
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.searchBar.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
//    [self.Button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.top.mas_equalTo(self.searchBar.mas_bottom);
//        make.bottom.mas_equalTo(0);
//    }];
}

- (void)loadData
{
    
}

#pragma mark - Getter and Setter

// 懒加载
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"搜索";//无内容时显示的字符
    }
    return _searchBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        UIView *viewFooter = [[UIView alloc] initWithFrame:CGRectZero];
        viewFooter.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = viewFooter;
    }
    return _tableView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            
        ANHomeVC *commentVC = [[ANHomeVC alloc]init];
            [self.navigationController pushViewController:commentVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}
//- (UIButton *)Button {
//    if (!_Button){
//        _Button = [[UIButton alloc]init];
//    }
//    return _Button;
//}

@end
