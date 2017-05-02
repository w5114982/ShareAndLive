//
//  WYBaseTableViewCell.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/2.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
@interface WYBaseTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *titleImage;

@property(nonatomic,strong)UILabel *titleLabel;

- (void)getDataWithModel:(id)model;
@end
