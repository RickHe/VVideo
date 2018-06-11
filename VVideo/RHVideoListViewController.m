//
//  RHVideoListViewController.m
//  VVideo
//
//  Created by DaFenQI on 2018/6/7.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHVideoListViewController.h"
#import "RHFindAnchorCollectionViewCell.h"
#import "RHShowVideoViewController.h"

static NSString* const kCellIdentity = @"findAnchorCell";
static CGFloat const kMinInterSpacing = 1;
static CGFloat const kNumberOfVisibleCell = 2;

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNaviHeight ((KIsiPhoneX) ? 88 : 64)
#define kTabBarHeight ((KIsiPhoneX) ? 83 : 49)
#define kRHScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])
#define kRHScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kRHContentHeight (kRHScreenHeight - kNaviHeight - kTabBarHeight)

@interface RHVideoListViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RHVideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((self.view.bounds.size.width - kMinInterSpacing * 2) / kNumberOfVisibleCell, self.view.bounds.size.height / kNumberOfVisibleCell);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = kMinInterSpacing;
    layout.minimumInteritemSpacing = kMinInterSpacing;
    layout.sectionInset = UIEdgeInsetsZero;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    self.collectionView.contentSize = CGSizeMake(self.view.bounds.size.width , 0);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RHFindAnchorCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kCellIdentity];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - collectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _datasources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RHFindAnchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentity forIndexPath:indexPath];
    NSDictionary *dic = _datasources[indexPath.row];
    [cell configCellForURL:dic[@"coverURL"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RHShowVideoViewController *showVideoVC = [[RHShowVideoViewController alloc] init];
    NSDictionary *dic = _datasources[indexPath.row];
    showVideoVC.videoURL = dic[@"videoURL"];
    [self.navigationController pushViewController:showVideoVC animated:YES];
}

@end
