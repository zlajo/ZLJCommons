//
// Created by zlajo on 31/1/13.
//


#import "NSArray+Extensions.h"


@implementation NSArray (Extensions)

+ (NSArray *)arrayWithNumbersInRange:(NSRange)range {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:range.length];
    for (NSUInteger i = range.location; i < range.location + range.length; i++) {
        [array addObject:@(i)];
    }
    return array;
}

@end
