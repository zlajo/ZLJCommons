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
// inspired by https://gist.github.com/Jaybles/1323251.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum UIPlatformVersion {
    UIPlatformIPhone1,
    UIPlatformIPhone3G,
    UIPlatformIPhone3GS,
    UIPlatformIPhone4,
    UIPlatformIPhone4S,
    UIPlatformIPhone5,

    UIPlatformIPodTouch1G,
    UIPlatformIPodTouch2G,
    UIPlatformIPodTouch3G,
    UIPlatformIPodTouch4G,
    UIPlatformIPodTouch5G,

    UIPlatformIPad1,
    UIPlatformIPad2,
    UIPlatformIPad3,
    UIPlatformIPad4,

    UIPlatformIPadMini1,

    UIPlatformSimulator,

    UIPlatformUnknown
} UIPlatformVersion;


typedef enum UIPlatformFamily {
    UIPlatformIPhone,
    UIPlatformIPodTouch,
    UIPlatformIPad,
    UIPlatformIPadMini,
    UIPlatformFamilySimulator,
    UIPlatformFamilyUnknown
} UIPlatformFamily;


@interface UIDevice (Platform)

@property (nonatomic, readonly) NSString *platformIdentifier;

@property (nonatomic, readonly) UIPlatformVersion platformVersion;

@property (nonatomic, readonly) UIPlatformFamily platformFamily;

@end