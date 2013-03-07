//
// Created by zlajo on 5/2/13.
//


#import "ZLJCommonMacros.h"

#import "NSOperationQueue+BackgroundQueue.h"


@implementation NSOperationQueue (BackgroundQueue)

+ (instancetype)backgroundQueue {
    return SINGLETON;
}

+ (instancetype)sequentialBackgroundQueue {
    return SINGLETON_WITH_INITIALIZATION(^(NSOperationQueue *queue) {
        queue.maxConcurrentOperationCount = 1;
    });
}

@end
