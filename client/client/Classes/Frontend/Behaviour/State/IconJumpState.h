// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef IconJumpState_h
#define IconJumpState_h
#import <iOSObjectiveCFoundation/iOSObjectiveCFoundation.h>
#import "IconBehaviour.h"
@interface IconJumpState : FiniteState<IconBehaviour*> {
    Parabora* parabora;
}
- (void)create;
- (void)update:(NSTimeInterval)delta;
@end
#endif /* IconJumpState_h */
