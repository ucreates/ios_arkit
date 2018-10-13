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
#import "ViewController.h"
@interface ViewController ()<ARSCNViewDelegate, SCNSceneRendererDelegate, INotifyDelegate>
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouch:)];
    ARSCNView *sceneView = (ARSCNView *)self.view;
    sceneView.delegate = self;
    sceneView.preferredFramesPerSecond = 30;
    sceneView.parentViewController = self;
    sceneView.showsStatistics = NO;
    sceneView.scene = [[SCNScene alloc] init];
    [sceneView addGestureRecognizer:gesture];
    self->enableTouch = NO;
    self->lastTime = 0.0f;
    self->behaviour = [[IconBehaviour alloc] init];
    Notifier *notifier = [Notifier getInstance];
    [notifier add:self];
    return;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    ARSCNView *sceneView = (ARSCNView *)self.view;
    [sceneView.session runWithConfiguration:configuration];
    return;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    ARSCNView *sceneView = (ARSCNView *)self.view;
    [sceneView.session pause];
    return;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    return;
}
- (void)renderer:(id<SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time {
    if (0.0f == self->lastTime) {
        self->lastTime = time;
    }
    float delta = time - self->lastTime;
    [self->behaviour onUpdate:delta];
    self->lastTime = time;
    return;
}
- (void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    Parameter *parameter = [[Parameter alloc] init];
    [parameter set:@"node" parameter:node];
    [self->behaviour onCreate:parameter];
    return;
}
- (void)renderer:(id<SCNSceneRenderer>)renderer willUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    return;
}
- (void)renderer:(id<SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    return;
}
- (void)renderer:(id<SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    return;
}
- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    [ConsoleStream write:error.description];
    return;
}
- (void)sessionWasInterrupted:(ARSession *)session {
    return;
}
- (void)sessionInterruptionEnded:(ARSession *)session {
    return;
}
- (void)onNotify:(NotifyMessage)notifyMessage parameter:(Parameter *)parameter {
    if (OnTrackingFound == notifyMessage || OnActionComplete == notifyMessage) {
        self->enableTouch = YES;
    }
    return;
}
- (void)onTouch:(UITapGestureRecognizer *)sender {
    if (NO == self->enableTouch) {
        return;
    }
    ARSCNView *sceneView = (ARSCNView *)self.view;
    CGPoint point = [sender locationInView:sceneView];
    NSArray<ARHitTestResult *> *hitTestResults = [sceneView hitTest:point types:ARHitTestResultTypeExistingPlaneUsingExtent];
    if (0 == hitTestResults.count) {
        return;
    }
    Notifier *notifier = [Notifier getInstance];
    [notifier notify:OnRaycastHit];
    self->enableTouch = NO;
    return;
}
@end
