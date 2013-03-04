//
// Created by zlajo on 4/3/13.
//


#import <Kiwi/Kiwi.h>

#import "ZLJCommonMacros.h"


@interface SingletonObject : NSObject

+ (instancetype)sharedInstance;

@end

@implementation SingletonObject

+ (instancetype)sharedInstance {
    return SINGLETON;
}

@end


SPEC_BEGIN(ZLJCommonsSpec)

describe(@"Singleton Macro", ^{
    it(@"should always provide the same object.", ^{
        SingletonObject *first = [SingletonObject sharedInstance];
        SingletonObject *second = [SingletonObject sharedInstance];

        [[first should] beIdenticalTo:second];
    });
});

SPEC_END
