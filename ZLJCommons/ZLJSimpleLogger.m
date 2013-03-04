//
// Created by zlajo on 4/3/13.
//


#import "ZLJSimpleLogger.h"
#import "ZLJCommonMacros.h"


@implementation ZLJSimpleLogger

+ (instancetype)sharedInstance {
    return SINGLETON;
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
