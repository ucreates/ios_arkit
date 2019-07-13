// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef IconShowState_h
#define IconShowState_h
#import "iOSObjectiveCFoundation.h"
#import "IconBehaviour.h"
@interface IconShowState : FiniteState<IconBehaviour*>
- (void)create;
- (void)update:(NSTimeInterval)delta;
@end
#endif /* IconShowState_h */
