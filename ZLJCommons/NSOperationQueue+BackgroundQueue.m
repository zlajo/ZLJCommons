//
// Created by zlajo on 5/2/13.
//


#import "NSOperationQueue+BackgroundQueue.h"

#import "ZLJCommonMacros.h"


@implementation NSOperationQueue (BackgroundQueue)

+ (instancetype)backgroundQueue {
    return SINGLETON;
}

@end
