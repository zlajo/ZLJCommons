//
//  Created by Johannes Zlattinger on 5/2/13.
//  Copyright (c) 2013 Johannes Zlattinger. All rights reserved.
//


#import "ZLJMath.h"

#pragma mark - Conversions

inline NSUInteger NSUIntegerFromNSInteger(NSInteger x) {
    if (x >= 0) {
        return (NSUInteger)x;
    } else {
        NSCAssert(false, @"Cannot convert '%d' to NSUInteger", x);
        return NAN;
    }
}

inline NSUInteger NSUIntegerFromCGFloat(CGFloat x) {
    if (lrint(x) == x) {
        return NSUIntegerFromNSInteger(lrint(x));
    } else {
        NSCAssert(false, @"Cannot convert '%.2f' to NSUInteger", x);
        return NAN;
    }
}

#pragma mark - Misc

inline float fsignf(float number) {
    return number / fabsf(number);
}
