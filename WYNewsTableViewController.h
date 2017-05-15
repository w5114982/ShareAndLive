//
//  WYNewsTableViewController.h
//  
//
//  Created by MR-BusWang on 17/5/11.
//
//

#import "WYBaseTableViewController.h"
#import <UIKit/UIKit.h>
@interface WYNewsTableViewController : WYBaseTableViewController
@property (nonatomic , copy)NSString  *url;

@property (nonatomic , copy)NSString  *dataTitle;

@property (nonatomic , copy)NSString   *key;
@end
