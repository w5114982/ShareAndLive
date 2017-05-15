//
//  WYCellFactory.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/9.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYOneImageTableViewCell.h"
#import "WYOneBigImageTableViewCell.h"
#import "WYImagesTableViewCell.h"
@interface WYCellFactory : NSObject


typedef NS_ENUM(NSUInteger,CellType){
 NewsOneImageCell = 0,
    NewsOneImageCellSpecial,
    NewsImagesCell,
    NewsOneBigImageCell,
};


@end