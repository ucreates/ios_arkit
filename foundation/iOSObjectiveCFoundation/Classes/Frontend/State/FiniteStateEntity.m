// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "FiniteStateEntity.h"
@implementation FiniteStateEntity
@synthesize isNewState;
@synthesize state;
@synthesize currentStateName;
@synthesize previousStateName;
@synthesize nextStateName;
- (id)init:(id)owner {
    self->isNewState = NO;
    self->state = nil;
    self->currentStateName = nil;
    self->previousStateName = nil;
    self->nextStateName = nil;
    return self;
}
- (void)update:(NSString*)nextStateName nextState:(id)nextState {
    if (NO == [self->currentStateName isEqualToString:nextStateName]) {
        self->previousStateName = self->currentStateName;
        self->currentStateName = nextStateName;
    }
    self.state = nextState;
    self.isNewState = YES;
    return;
}
@end
