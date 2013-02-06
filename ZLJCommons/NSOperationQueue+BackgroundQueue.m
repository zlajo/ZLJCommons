//
// Created by zlajo on 5/2/13.
//


#import "NSOperationQueue+BackgroundQueue.h"


@implementation NSOperationQueue (BackgroundQueue)

+ (instancetype)backgroundQueue {
    static NSOperationQueue *backgroundQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        backgroundQueue = [[NSOperationQueue alloc] init];
    });
    return backgroundQueue;
}

@end
