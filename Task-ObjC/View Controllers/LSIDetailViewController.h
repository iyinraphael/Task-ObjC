//
//  LSIDetailViewController.h
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSITask;
@class LSITaskController;

NS_ASSUME_NONNULL_BEGIN

@interface LSIDetailViewController : UIViewController

@property (nonatomic, strong) LSITask *task;
@property (nonatomic, strong) LSITaskController *tasksController;

@end

NS_ASSUME_NONNULL_END
