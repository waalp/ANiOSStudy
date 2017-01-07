//
//  ANHomeVC.m
//  ANiOSStudy
//
//  Created by Anson on 2017/1/7.
//  Copyright © 2017年 An. All rights reserved.
//

#import "ANHomeVC.h"

@interface ANHomeVC () <UITableViewDataSource, UITableViewDelegate>

/*
 UI
 */
@property (nonatomic, strong) UISearchBar *searchBar;  ///< Search
@property (nonatomic, strong) UITableView *tableView;  ///< TableView

/*
 Data
 */
@property (nonatomic, strong) NSArray *dataSource;  ///< Data Source

@end

@implementation ANHomeVC

#pragma mark - View Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Home";
    self.tabBarItem.title = @"HomeTab";
    
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
    
    return cell;
}

#pragma mark - Private Method

- (void)setData
{
    _dataSource = @[@"first", @"second", @"third"];
}

- (void)setUI
{
//    [self.view addSubview:self.searchBar];
//    [self.view addSubview:self.tableView];
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
}

- (void)loadData
{
    
}

#pragma mark - Getter and Setter

// 懒加载
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"搜索";
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

@end
