//
// Created by zlajo on 6/11/12.
//


#import <Kiwi/Kiwi.h>

#import "NSArray+Extensions.h"


SPEC_BEGIN(NSArrayExtensionsSpec)

describe(@"NSArray+Extensions", ^{
    it(@"should generate an empty array given an empty range.", ^{
        NSArray *numbers = [NSArray arrayWithNumbersInRange:NSMakeRange(0, 0)];
        [[numbers should] beEmpty];
    });

    it(@"should generate an array containing only range start given a length of one.", ^{
        NSArray *zero = [NSArray arrayWithNumbersInRange:NSMakeRange(0, 1)];
        [[zero should] haveCountOf:1];
        [[zero should] contain:@(0)];

        NSArray *one = [NSArray arrayWithNumbersInRange:NSMakeRange(1, 1)];
        [[one should] haveCountOf:1];
        [[one should] contain:@(1)];
    });

    it(@"should generate an array containing length elements starting with location.", ^{
        NSArray *numbers = [NSArray arrayWithNumbersInRange:NSMakeRange(0, 3)];
        [[numbers should] haveCountOf:3];
        [[numbers should] containObjects:@(0), @(1), @(2), nil];
    });
});

SPEC_END
