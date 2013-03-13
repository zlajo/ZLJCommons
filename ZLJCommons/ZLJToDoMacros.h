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

/* Usage: Use TODO("some message") / FIXME("some message") / NOTE("some message") to generate appropriate warnings */
#define TODO(x) GENERATE_PRAGMA(message("[TODO] " x))
#define FIXME(x) GENERATE_PRAGMA(message("[FIXME] " x))
#define NOTE(x) GENERATE_PRAGMA(message("[NOTE] " x))

/* Usage example:
 *     view.frame = CGRectMake(0, 0, MAGIC_NUMBER(77), MAGIC_NUMBER(90));
 *
 * It will warn you that you should replace values 77 and 90 with constants later, because magic numbers are bad.
 */
#define MAGIC_NUMBER(x) (({ FIXME("Replace magic number " #x " with constant") }), (x))

/* Usage example:
 *     NOT_IMPLEMENTED("This should show the details in a separate screen")
 *
 * Call this in some IBAction that you will implement later, to generate a warning
 * at compile time AND display an alert at runtime if the user trigger the IBAction
 */
#define NOT_IMPLEMENTED(warningMessage) \
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__] \
        message:[NSString stringWithFormat:@"%s",warningMessage] \
        delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show]; \
        TODO("Implement __PRETTY_FUNCTION__ - " warningMessage)
