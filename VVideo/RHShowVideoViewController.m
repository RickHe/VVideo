//
//  RHShowVideoViewController.m
//  VVideo
//
//  Created by DaFenQI on 2018/6/7.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHShowVideoViewController.h"
#import "RHPlayerView.h"

@interface RHShowVideoViewController () {
    RHPlayerView *_playerView;
}

@end

@implementation RHShowVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _playerView = [[RHPlayerView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_playerView];
    _playerView.url = [NSURL URLWithString:self.videoURL];
}

- (void)setVideoURL:(NSString *)videoURL {
    _videoURL = videoURL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
