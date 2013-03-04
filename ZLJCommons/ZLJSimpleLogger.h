//
// Created by zlajo on 4/3/13.
//


#import <Foundation/Foundation.h>
#import <CocoaLumberjack/DDLog.h>


@interface ZLJSimpleLogger : DDAbstractLogger <DDLogger>

+ (instancetype)sharedInstance;

@end
