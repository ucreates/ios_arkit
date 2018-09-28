// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TimeLine.h"
@implementation TimeLine
@synthesize currentFrame;
@synthesize currentTime;
@synthesize rate;
- (id)init {
    self = [super init];
    self.currentFrame = 0.0f;
    self.currentTime = 0.0f;
    self.rate = 1.0f;
    return self;
}
- (void)next:(NSTimeInterval)delta {
    [self next:delta multipleRate:1.0f];
    return;
}
- (void)next:(NSTimeInterval)delta multipleRate:(float)multipleRate {
    self.currentFrame += self.rate;
    self.currentTime += (delta * multipleRate);
    return;
}
- (void)restore {
    self.currentFrame = 0.0f;
    self.currentTime = 0.0f;
    return;
}
@end
