// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "FiniteState.h"
@implementation FiniteState
@synthesize owner;
@synthesize timeLine;
@synthesize persistent;
@synthesize complete;
@synthesize wait;
@synthesize initialize;
@synthesize emitCallback;
@synthesize dump;
- (id)init {
    self = [super init];
    self.timeLine = [[TimeLine alloc] init];
    return self;
}
- (void)create {
    return;
}
- (void)create:(Parameter*)parameter {
    return;
}
- (void)update:(NSTimeInterval)delta {
    return;
}
@end
