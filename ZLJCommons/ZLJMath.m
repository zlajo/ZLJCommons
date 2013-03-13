//
// Copyright (c) 2013, Johannes Zlattinger
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import <math.h>

#import "ZLJMath.h"


#pragma mark - Conversions

NSUInteger NSUIntegerFromNSInteger(NSInteger x) {
    if (x >= 0) {
        return (NSUInteger)x;
    } else {
        NSCAssert(false, @"Cannot convert '%d' to NSUInteger", x);
        return NAN;
    }
}

NSUInteger NSUIntegerFromCGFloat(CGFloat x) {
    if (lrint(x) == x) {
        return NSUIntegerFromNSInteger(lrint(x));
    } else {
        NSCAssert(false, @"Cannot convert '%.2f' to NSUInteger", x);
        return NAN;
    }
}

#pragma mark - Misc

float fsignf(float number) {
    return number / fabsf(number);
}
