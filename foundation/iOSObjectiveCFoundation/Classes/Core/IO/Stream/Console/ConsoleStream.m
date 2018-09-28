// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "ConsoleStream.h"
static const NSString* kIdentifier = @"IOS_FOUNDATION";
static const NSString* kEnter = @"[ENTER]";
@implementation ConsoleStream
+ (void)write:(NSString*)val {
    NSString* logMessage = [NSString stringWithFormat:@"%@::%@", kIdentifier, val];
    NSLog(@"%@", logMessage);
    return;
}
@end
