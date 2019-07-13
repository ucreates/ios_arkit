// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef IconBeatState_h
#define IconBeatState_h
#import "iOSObjectiveCFoundation.h"
#import "IconBehaviour.h"
@interface IconBeatState : FiniteState<IconBehaviour*> {
    Bouncy* bouncy;
}
- (void)create;
- (void)update:(NSTimeInterval)delta;
@end
#endif /* IconBeatState_h */
