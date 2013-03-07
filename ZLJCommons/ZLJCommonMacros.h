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

/* Usage:
 *  PERFORM_IN_BACKGROUND_WITH_ACTIVITY_INDICATION(myActivityIndicatorView, ^{
 *      // perform background task (be careful with UIKit related stuff!)
 *  });
 */
#define PERFORM_IN_BACKGROUND_WITH_ACTIVITY_INDICATION(activityIndicator_, block_) \
    ^void (UIActivityIndicatorView *activityIndicator, void (^block)(void)) { \
        [[NSOperationQueue backgroundQueue] addOperationWithBlock:^{ \
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{ \
                [activityIndicator startAnimating]; \
            }]; \
            block(); \
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{ \
                [activityIndicator stopAnimating]; \
            }]; \
        }]; \
    } (activityIndicator_, block_)
