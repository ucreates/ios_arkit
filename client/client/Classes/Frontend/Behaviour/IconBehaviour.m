// ======================================================================
// Project Name    : ios_arkit
//
// Copyright © 2018 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import <iOSObjectiveCFoundation/iOSObjectiveCFoundation.h>
#import "IconBehaviour.h"
#import "IconShowState.h"
#import "IconBeatState.h"
#import "IconJumpState.h"
@interface IconBehaviour ()<INotifyDelegate>
@end
@implementation IconBehaviour
@synthesize stateMachine;
@synthesize defaultPosition;
@synthesize node;
- (id)init {
    self = [super init];
    self.defaultPosition = SCNVector3Zero;
    self.stateMachine = [[FiniteStateMachine<IconBehaviour*> alloc] init:self];
    [self.stateMachine add:@"show" state:[[IconShowState alloc] init]];
    [self.stateMachine add:@"beat" state:[[IconBeatState alloc] init]];
    [self.stateMachine add:@"jump" state:[[IconJumpState alloc] init]];
    [self.stateMachine stop];
    Notifier* notifier = [Notifier getInstance];
    [notifier add:self];
    return self;
}
- (void)onCreate:(Parameter*)parameter {
    SCNNode* rootNode = (SCNNode*)[parameter get:@"node"];
    SCNScene* scene = [SCNScene sceneNamed:@"art.scnassets/apple.obj"];
    SCNLight* light = [[SCNLight alloc] init];
    SCNNode* lightNode = [[SCNNode alloc] init];
    light.type = SCNLightTypeOmni;
    light.color = UIColor.whiteColor;
    light.intensity = 1000.0f;
    lightNode.light = light;
    lightNode.position = SCNVector3Make(0, 30, 0);
    lightNode.eulerAngles = SCNVector3Make(-90, 0, 0);
    self.node = scene.rootNode.childNodes[0];
    self.node.geometry.firstMaterial.diffuse.contents = UIColor.whiteColor;
    self.node.scale = SCNVector3Zero;
    self.node.hidden = YES;
    self.defaultPosition = self.node.position;
    dispatch_block_t block = ^{
        [rootNode addChildNode:self.node];
        [rootNode addChildNode:lightNode];
        [self.stateMachine change:@"show"];
        [self.stateMachine play];
    };
    [DispatchQueue async:block];
    return;
}
- (void)onUpdate:(NSTimeInterval)delta {
    [self->stateMachine update:delta];
    return;
}
- (void)onNotify:(NotifyMessage)notifyMessage parameter:(Parameter*)parameter {
    if (OnRaycastHit != notifyMessage) {
        return;
    }
    int i = arc4random_uniform(11);
    if (0 == i % 2) {
        [self.stateMachine change:@"beat"];
    } else {
        [self.stateMachine change:@"jump"];
    }
    [self.stateMachine play];
    return;
}
@end
