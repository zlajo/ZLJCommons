//
// Created by zlajo on 4/3/13.
//

/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON;
 *  }
 */
#define SINGLETON SINGLETON_WITH_INITIALIZATION(^(id _) {})

/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON(^(id sharedInstance) {
 *          // finish setup of shared instance
 *      });
 *  }
 */
#define SINGLETON_WITH_INITIALIZATION(block) ^{\
    static id sharedInstance; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance = [[self alloc] init]; \
        block(sharedInstance);\
    }); \
    return sharedInstance; \
}()

