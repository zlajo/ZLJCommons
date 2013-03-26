//
// Copyright (c) 2013, Johannes Zlattinger
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Singleton Macros
//

/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON;
 *  }
 */
#define SINGLETON SINGLETON_WITH_FACTORY(^{ return [[self alloc] init]; })


/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON(^(id sharedInstance) {
 *          // finish setup of shared instance
 *      });
 *  }
 */
#define SINGLETON_WITH_INITIALIZATION(block) SINGLETON_WITH_FACTORY(^{\
    sharedInstance = [[self alloc] init]; \
    block(sharedInstance); \
    return sharedInstance; \
})


/* Usage:
 *  + (instancetype)sharedInstance {
 *      return SINGLETON(^{
 *          return [[self alloc] init];
 *      });
 *  }
 */
#define SINGLETON_WITH_FACTORY(block) ^{\
    static id sharedInstance; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance = block(); \
    }); \
    return sharedInstance; \
}()

//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// System Versioning Preprocessor Macros
// see http://stackoverflow.com/a/5337804/150373
//

/* Usage:
 *  if (SYSTEM_VERSION_EQUAL_TO(@"6.0")) {
 *      // do something useful
 *  }
 */
#define SYSTEM_VERSION_EQUAL_TO(v) \
	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) \
	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) \
	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) \
	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) \
	([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
