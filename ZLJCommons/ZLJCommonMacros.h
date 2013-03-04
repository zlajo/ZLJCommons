//
// Created by zlajo on 4/3/13.
//

/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON;
 *  }
 */
#define SINGLETON ^{\
    static id sharedInstance; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance = [[self alloc] init]; \
    }); \
    return sharedInstance; \
}()

