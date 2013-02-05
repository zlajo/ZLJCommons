//
// Created by Johannes Zlattinger on 05.02.13.
//
// Copyright 2012 pixelpoint multimedia & werbe gmbh. All rights reserved.
//
// This category was inspired by https://gist.github.com/Jaybles/1323251.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum UIPlatform {
    UIPlatformIPhone,
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

    UIPlatformIPad,
    UIPlatformIPad2,
    UIPlatformIPad3,
    UIPlatformIPad4,
    UIPlatformIPadMini,

    UIPlatformSimulator,

    UIPlatformUnknown
} UIPlatform;


@interface UIDevice (Platform)

@property (nonatomic, readonly) UIPlatform platform;

@end