//
// Created by Johannes Zlattinger on 05.02.13.
//
// Copyright 2012 pixelpoint multimedia & werbe gmbh. All rights reserved.
//


#include <sys/sysctl.h>

#import "UIDevice+Platform.h"


@implementation UIDevice (Platform)

+(NSDictionary *)platformIdentifierMappings {
    static NSDictionary *mappings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mappings = @{
			@"iPhone1,1" : @(UIPlatformIPhone),
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
			@"iPad1,1" : @(UIPlatformIPad),
			@"iPad2,1" : @(UIPlatformIPad2),
			@"iPad2,2" : @(UIPlatformIPad2),
			@"iPad2,3" : @(UIPlatformIPad2),
			@"iPad2,5" : @(UIPlatformIPadMini),
			@"iPad2,6" : @(UIPlatformIPadMini),
			@"iPad2,7" : @(UIPlatformIPadMini),
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

- (NSString *)platformIdentifier {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

- (UIPlatform)platform {
    if ([[UIDevice platformIdentifierMappings] valueForKey:[self platformIdentifier]]) {
        return (UIPlatform)[[[UIDevice platformIdentifierMappings] valueForKey:self.platformIdentifier] intValue];
    } else {
        return UIPlatformUnknown;
    }
}

@end