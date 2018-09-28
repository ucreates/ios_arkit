// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "FiniteStateMachine.h"
@implementation FiniteStateMachine
@synthesize finiteStateEntity;
@synthesize stateList;
@synthesize persistentStateList;
@synthesize paramter;
@synthesize owner;
@synthesize enableFrameSkip;
@synthesize frameSkipCounter;
- (id)init:(id)owner {
    self.finiteStateEntity = [[FiniteStateEntity<id> alloc] init];
    self.owner = owner;
    self.persistentStateList = [[NSMutableDictionary<NSString*, FiniteState<id>*> alloc] init];
    self.stateList = [[NSMutableDictionary<NSString*, FiniteState<id>*> alloc] init];
    return self;
}
- (void)change:(NSString*)newStateName {
    [self change:newStateName parameter:nil update:NO];
    return;
}
- (void)change:(NSString*)newStateName update:(BOOL)update {
    [self change:newStateName parameter:nil update:update];
    return;
}
- (void)change:(NSString*)newStateName parameter:(Parameter*)parameter update:(BOOL)update {
    self.paramter = parameter;
    id nextState = [self get:newStateName];
    if (nil == nextState) {
        return;
    }
    [self.finiteStateEntity update:newStateName nextState:nextState];
    return;
}
- (void)update:(NSTimeInterval)delta {
    if (nil != self.finiteStateEntity.state && NO == self.finiteStateEntity.state.complete) {
        if (NO != self.finiteStateEntity.isNewState) {
            if (nil != self.paramter) {
                [self.finiteStateEntity.state create:self.paramter];
            } else {
                [self.finiteStateEntity.state create];
            }
            self.finiteStateEntity.isNewState = NO;
        }
        if (nil != self.finiteStateEntity.state && NO == self.finiteStateEntity.state.complete && NO == self.finiteStateEntity.state.wait) {
            [self.finiteStateEntity.state update:delta];
        }
    }
    for (NSString* key in [self.persistentStateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        [state update:delta];
    }
    return;
}
- (void)play {
    for (NSString* key in [self.stateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        state.wait = NO;
        state.complete = NO;
    }
    for (NSString* key in [self.persistentStateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        state.wait = NO;
        state.complete = NO;
        [state create];
    }
    return;
}
- (void)pause {
    for (NSString* key in [self.stateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        state.wait = YES;
    }
    return;
}
- (void)stop {
    for (NSString* key in [self.stateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        state.complete = YES;
    }
    for (NSString* key in [self.persistentStateList allKeys]) {
        FiniteState<id>* state = [self.stateList objectForKey:key];
        state.complete = YES;
    }
    return;
}
- (BOOL)add:(NSString*)stateName state:(id)state {
    FiniteState<id>* fstate = (FiniteState<id>*)state;
    if (NO == fstate.persistent) {
        if (NO == [self.stateList.allKeys containsObject:stateName]) {
            fstate.owner = self.owner;
            fstate.stateMachine = self;
            [self.stateList setObject:fstate forKey:stateName];
            return YES;
        }
    } else {
        if (NO == [self.persistentStateList.allKeys containsObject:stateName]) {
            fstate.owner = self.owner;
            fstate.stateMachine = self;
            [self.persistentStateList setObject:fstate forKey:stateName];
            return YES;
        }
    }
    return NO;
}
- (id)get:(NSString*)newStateName {
    id ret = nil;
    if (NO != [self.stateList.allKeys containsObject:newStateName]) {
        ret = [self.stateList objectForKey:newStateName];
    } else if (NO != [self.persistentStateList.allKeys containsObject:newStateName]) {
        ret = [self.persistentStateList objectForKey:newStateName];
    }
    return ret;
}
@end
