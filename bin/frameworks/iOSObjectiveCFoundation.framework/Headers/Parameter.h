// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Parameter_h
#define Parameter_h
#import <Foundation/Foundation.h>
@interface Parameter : NSObject
@property NSMutableDictionary<NSString*, id>* parmeterDictionary;
- (id)get:(NSString*)name;
- (void)set:(NSString*)name parameter:(id)parameter;
@end
#endif /* Parameter_h */
