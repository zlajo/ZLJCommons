//
// Created by zlajo on 4/3/13.
//


#import "ZLJSimpleLogger.h"


@implementation ZLJSimpleLogger

+ (instancetype)sharedInstance {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;
    if (formatter) {
       logMsg = [formatter formatLogMessage:logMessage];
   }

    if (logMsg) {
        NSLog(@"%@", logMsg);
    }
}

@end
