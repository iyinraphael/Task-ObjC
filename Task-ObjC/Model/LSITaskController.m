//
//  LSITaskController.m
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSITaskController.h"

@interface LSITaskController()

@property (nonatomic) NSMutableArray *internalTasks;

@end


@implementation LSITaskController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addTask:(LSITask *)task
{
    [self.internalTasks addObject:task];
}

- (void)removeTask:(LSITask *)task
{
    [self.internalTasks removeObject:task];
}

- (NSArray *)tasks
{
    return [self.internalTasks copy];
}

@end
