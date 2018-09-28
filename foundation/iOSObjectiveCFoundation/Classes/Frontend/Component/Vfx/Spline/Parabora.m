// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Parabora.h"
static const float kGravity = 0.98f;
@implementation Parabora
@synthesize mass;
@synthesize velocity;
@synthesize radian;
- (id)init {
    self = [super init];
    self.velocity = 1.0f;
    self.mass = 1.0f;
    self.radian = 0.0f;
    return self;
}
- (SCNVector3)create:(float)currentFrame {
    float sin = sinf(self.radian);
    float cos = cosf(self.radian);
    float nx = self.velocity * cos * currentFrame;
    float ny = (self.velocity * sin * currentFrame) - (kGravity * powf(currentFrame, 2.0f) / 2.0f);
    return SCNVector3Make(nx, ny, 0.0f);
}
@end
