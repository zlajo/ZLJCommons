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
// inspired by: https://github.com/AliSoftware/Xcode-Utils
//


#ifndef GENERATE_PRAGMA

#define GENERATE_PRAGMA(x) _Pragma(#x)

#endif

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
