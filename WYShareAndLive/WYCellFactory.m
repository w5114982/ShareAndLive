//
//  WYCellFactory.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/9.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYCellFactory.h"
#import "WYNewsModel.h"
@implementation WYCellFactory

+ (WYBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath{
    return [self cellWithTableView:tableView Model:model IndexPath:indexPath Type:[self cellTypeWithModel:model]];
}

+ (CGFloat)cellHeightWIthModel:(id)model{
    return [self cellHeightWithModel:model Type:[self cellHeightWIthModel:model]];
}

+ (CellType)cellTypeWithModel:(id)model{
  //  [model class] == [WYNewsModel class]) {
        WYNewsModel *newsModel = (WYNewsModel *)model;
        if (newsModel.imgType)
            return NewsOneBigImageCell;
        else if(newsModel.imgextra) return
            NewsImagesCell;
      else if([newsModel.skipType isEqual:@"special"])
          return NewsOneImageCellSpecial;
      else return NewsOneImageCell;
    
}

+ (WYBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath Type:(CellType)type{
    WYBaseTableViewCell *result = nil;
    switch (type) {
        case NewsOneImageCell:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSONEIMAGECELL];
            break;
         case NewsOneBigImageCell:
            result  = [tableView dequeueReusableCellWithIdentifier:NEWSONEBIGIMAGECELL];
            case NewsImagesCell:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSIMAGESCELL];
            case NewsOneImageCellSpecial:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSONEIMAGECELLSPECIAL];
            break;
        }
    [result getDataWithModel:model];
    return result;
}

+ (CGFloat)cellHeightWithModel:(id)model Type:(CellType)type{
    switch (type) {
        case NewsOneImageCell:
            return ONEIMAGECELLHEIGHT;
            break;
        case NewsOneBigImageCell:
            return ONEBIGIMAGECELLHEIGHT;
            break;
            case NewsImagesCell:
            return IMAGESCELLHEIGHT;
            break;
            case NewsOneImageCellSpecial:
            
            return ONEIMAGECELLHEIGHT;
            break;
       
    }
    
}
@end
