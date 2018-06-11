//
//  RHFindAnchorCollectionViewCell.m
//  KnowledgeSharing
//
//  Created by DaFenQI on 2018/5/3.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHFindAnchorCollectionViewCell.h"
#import "UIImageView+WebCache.h"
//#import <SDWebImage/UIImageView+WebCache.h>

@interface RHFindAnchorCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgrounImageView;

@end

@implementation RHFindAnchorCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configCellForURL:(NSString *)url {
    [self.backgrounImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"test.jpeg"]];
}

@end
