//
//  ViewController.m
//  VVideo
//
//  Created by DaFenQI on 2018/6/7.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "ViewController.h"
#import "RHVideoListViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_datas;
    NSMutableArray *_titles;
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubview];
    [self loadData];
}

- (void)loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    _datas = [NSArray arrayWithContentsOfFile:filePath];
    _titles = [NSMutableArray new];
    for (int i = 0; i < _datas.count; i++) {
        [_titles addObject:[NSString stringWithFormat:@"视频%i", i]];
    }
    [self.tableview reloadData];
}

- (void)setupSubview {
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableview.tableFooterView = [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RHVideoListViewController *vc = [[RHVideoListViewController alloc] init];
    vc.datasources = _datas[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
