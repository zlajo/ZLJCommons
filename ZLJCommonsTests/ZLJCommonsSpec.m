//
// Created by zlajo on 4/3/13.
//


#import <Kiwi/Kiwi.h>

#import "ZLJCommonMacros.h"


@interface SingletonObjectOne : NSObject

+ (instancetype)sharedInstance;

@end

@implementation SingletonObjectOne

+ (instancetype)sharedInstance {
    return SINGLETON;
}

@end


@interface SingletonObjectTwo : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSString *string;

@end

@implementation SingletonObjectTwo

+ (instancetype)sharedInstance {
    return SINGLETON_WITH_FACTORY(^SingletonObjectTwo *{
        SingletonObjectTwo *obj = [[SingletonObjectTwo alloc] init];
        obj.string = @"SingletonObjectTwo has been created correctly.";
        return obj;
    });
}

@end


@interface SingletonObjectThree : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSString *string;

@end

@implementation SingletonObjectThree

+ (instancetype)sharedInstance {
    return SINGLETON_WITH_INITIALIZATION(^(SingletonObjectThree *obj){
        obj.string = @"SingletonObjectTwo has been created correctly.";
    });
}

@end


SPEC_BEGIN(ZLJCommonsSpec)

describe(@"Simple singleton macro", ^{
    it(@"should always provide the same object.", ^{
        SingletonObjectOne *first = [SingletonObjectOne sharedInstance];
        SingletonObjectOne *second = [SingletonObjectOne sharedInstance];

        [[first should] beIdenticalTo:second];
    });
});


describe(@"Singleton macro with factory", ^{
    it(@"should execute factory block correctly.", ^{
        [[[SingletonObjectTwo sharedInstance].string should] equal:@"SingletonObjectTwo has been created correctly."];
    });

    it(@"should always provide the same object.", ^{
        SingletonObjectTwo *first = [SingletonObjectTwo sharedInstance];
        SingletonObjectTwo *second = [SingletonObjectTwo sharedInstance];

        [[first should] beIdenticalTo:second];
    });
});

describe(@"Singleton macro with initialization block", ^{
    it(@"should execute factory block correctly.", ^{
        [[[SingletonObjectThree sharedInstance].string should] equal:@"SingletonObjectTwo has been created correctly."];
    });

    it(@"should always provide the same object.", ^{
        SingletonObjectThree *first = [SingletonObjectThree sharedInstance];
        SingletonObjectThree *second = [SingletonObjectThree sharedInstance];

        [[first should] beIdenticalTo:second];
    });
});

SPEC_END
