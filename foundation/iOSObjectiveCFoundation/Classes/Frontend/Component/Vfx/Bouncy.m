// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Bouncy.h"
static const float kGravity = 0.98f;
static const float kE = 0.5f;
@implementation Bouncy
@synthesize gravity;
@synthesize velocity;
@synthesize originVelocity;
- (id)init:(float)velocity rate:(float)rate {
    self = [super init];
    self.velocity = velocity;
    self.originVelocity = velocity;
    self.gravity = kGravity * rate;
    return self;
}
- (float)update {
    self.velocity -= self.gravity;
    return self.velocity;
}
- (void)restore {
    self.originVelocity *= kE;
    self.velocity = self.originVelocity;
    return;
}
@end
