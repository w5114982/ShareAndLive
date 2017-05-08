//
//  WYImagesTableViewCell.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYBaseTableViewCell.h"

@interface WYImagesTableViewCell : WYBaseTableViewCell
/**三个图片*/
@property(nonatomic,retain)UIImageView *imageCenter;
@property(nonatomic,retain)UIImageView *imageRight;
/**跟帖数*/
@property(nonatomic,retain)UILabel *replyCountLabel;
@end
