//
// Created by Johannes Zlattinger on 05.02.13.
//
// Copyright 2012 pixelpoint multimedia & werbe gmbh. All rights reserved.
//


#include <sys/sysctl.h>

#import "UIDevice+Platform.h"


@implementation UIDevice (Platform)

+ (NSDictionary *)platformVersionMappings {
    static NSDictionary *mappings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mappings = @{
			@"iPhone1,1" : @(UIPlatformIPhone1),
			@"iPhone1,2" : @(UIPlatformIPhone3G),
			@"iPhone2,1" : @(UIPlatformIPhone3GS),
			@"iPhone3,1" : @(UIPlatformIPhone4),
			@"iPhone3,3" : @(UIPlatformIPhone4),
			@"iPhone4,1" : @(UIPlatformIPhone4S),
			@"iPhone5,1" : @(UIPlatformIPhone5),
			@"iPhone5,2" : @(UIPlatformIPhone5),
			@"iPod1,1" : @(UIPlatformIPodTouch1G),
			@"iPod2,1" : @(UIPlatformIPodTouch2G),
			@"iPod3,1" : @(UIPlatformIPodTouch3G),
			@"iPod4,1" : @(UIPlatformIPodTouch4G),
			@"iPod5,1" : @(UIPlatformIPodTouch5G),
			@"iPad1,1" : @(UIPlatformIPad1),
			@"iPad2,1" : @(UIPlatformIPad2),
			@"iPad2,2" : @(UIPlatformIPad2),
			@"iPad2,3" : @(UIPlatformIPad2),
			@"iPad2,5" : @(UIPlatformIPadMini1),
			@"iPad2,6" : @(UIPlatformIPadMini1),
			@"iPad2,7" : @(UIPlatformIPadMini1),
			@"iPad3,1" : @(UIPlatformIPad3),
			@"iPad3,2" : @(UIPlatformIPad3),
			@"iPad3,3" : @(UIPlatformIPad3),
			@"iPad3,4" : @(UIPlatformIPad4),
			@"iPad3,5" : @(UIPlatformIPad4),
			@"iPad3,6" : @(UIPlatformIPad4),
			@"i386" : @(UIPlatformSimulator),
			@"x86_64" : @(UIPlatformSimulator)
        };
    });
    return mappings;
}

+ (NSDictionary *)platformFamilyMappings {
    static NSDictionary *mappings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mappings = @{
			@"iPhone1,1" : @(UIPlatformIPhone),
			@"iPhone1,2" : @(UIPlatformIPhone),
			@"iPhone2,1" : @(UIPlatformIPhone),
			@"iPhone3,1" : @(UIPlatformIPhone),
			@"iPhone3,3" : @(UIPlatformIPhone),
			@"iPhone4,1" : @(UIPlatformIPhone),
			@"iPhone5,1" : @(UIPlatformIPhone),
			@"iPhone5,2" : @(UIPlatformIPhone),
			@"iPod1,1" : @(UIPlatformIPodTouch),
			@"iPod2,1" : @(UIPlatformIPodTouch),
			@"iPod3,1" : @(UIPlatformIPodTouch),
			@"iPod4,1" : @(UIPlatformIPodTouch),
			@"iPod5,1" : @(UIPlatformIPodTouch),
			@"iPad1,1" : @(UIPlatformIPad),
			@"iPad2,1" : @(UIPlatformIPad),
			@"iPad2,2" : @(UIPlatformIPad),
			@"iPad2,3" : @(UIPlatformIPad),
			@"iPad2,5" : @(UIPlatformIPadMini),
			@"iPad2,6" : @(UIPlatformIPadMini),
			@"iPad2,7" : @(UIPlatformIPadMini),
			@"iPad3,1" : @(UIPlatformIPad),
			@"iPad3,2" : @(UIPlatformIPad),
			@"iPad3,3" : @(UIPlatformIPad),
			@"iPad3,4" : @(UIPlatformIPad),
			@"iPad3,5" : @(UIPlatformIPad),
			@"iPad3,6" : @(UIPlatformIPad),
			@"i386" : @(UIPlatformFamilySimulator),
			@"x86_64" : @(UIPlatformFamilySimulator)
        };
    });
    return mappings;
}

#pragma mark -

- (NSString *)platformIdentifier {
    static NSString *platformIdentifier;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        platformIdentifier = [NSString stringWithUTF8String:machine];
        free(machine);
    });
    return platformIdentifier;
}

- (UIPlatformVersion)platformVersion {
    if ([UIDevice.platformVersionMappings valueForKey:self.platformIdentifier]) {
        return (UIPlatformVersion)[[[UIDevice platformVersionMappings] valueForKey:self.platformIdentifier] intValue];
    } else {
        return UIPlatformUnknown;
    }
}

- (UIPlatformFamily)platformFamily {
    if ([UIDevice.platformFamilyMappings valueForKey:self.platformIdentifier]) {
        return (UIPlatformFamily)[[UIDevice.platformFamilyMappings valueForKey:self.platformIdentifier] intValue];
    } else {
        return UIPlatformFamilyUnknown;
    }
}

@end