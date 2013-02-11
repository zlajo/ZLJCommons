//
//  Created by Johannes Zlattinger on 1/2/13.
//  Copyright (c) 2013 Johannes Zlattinger. All rights reserved.
//
//  see: https://github.com/AliSoftware/Xcode-Utils
//

#define GENERATE_PRAGMA(x) _Pragma(#x)

/* Usage example:
 *     #if TARGET_IPHONE_SIMULATOR
 *     // Use some private API only in simulator to test my app memory mgmt, but _performMemoryWarning
 *     // is a private method so the selector is undeclared so we want to disable the warning
 *     DISABLE_WARNING(undeclared-selector,{
 *       [[UIApplication sharedApplication] performSelector:@selector(_performMemoryWarning)];
 *     })
 *     #endif
 */
#define DISABLE_WARNING(warning,code) \
  GENERATE_PRAGMA(clang diagnostic push) \
  GENERATE_PRAGMA(clang diagnostic ignored "-W" #warning) \
  code \
  GENERATE_PRAGMA(clang diagnostic pop)
