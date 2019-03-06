//
//  LSITaskController.h
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSITask;

NS_ASSUME_NONNULL_BEGIN

@interface LSITaskController : NSObject

- (void)addTask: (LSITask *)task;
- (void)removeTask: (LSITask *)task;

@property (nonatomic, readonly) NSArray *tasks;

@end

NS_ASSUME_NONNULL_END
