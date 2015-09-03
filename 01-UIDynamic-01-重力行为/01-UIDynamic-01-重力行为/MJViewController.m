//
//  MJViewController.m
//  01-UIDynamic-01-重力行为
//
//  Created by apple on 14-5-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end

@implementation MJViewController

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        // 创建物理仿真器(ReferenceView : 仿真范围)
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.segmentControl.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView]];
//    [collision addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, 200) toPoint:CGPointMake(320, 400)];
//    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 320, 320)];
    [collision addBoundaryWithIdentifier:@"cirlce" forPath:path];
    
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)test2
{
    // 1.创建物理仿真行为--->重力行为(items: 物理仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    //    gravity.gravityDirection = CGVectorMake(1, 1);
    //    gravity.angle = M_PI_2;
    gravity.magnitude = 1000;
    
    // magnitude == 1, 加速度: 1000 points/second²
    
    // 0  速度 0 points/second
    // 1  速度 1000 points/second
    // 2  速度 2000 points/second
    
    //   (1/2)*1000*4
    
    // 2.添加 物理仿真行为 到 物理仿真器
    [self.animator addBehavior:gravity];
    
    // 3.碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.segmentControl]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
}

- (void)test
{
    // 1.创建物理仿真行为--->重力行为(items: 物理仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    
    // 2.碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.segmentControl]];
    // 让参照视图的bounds成为碰撞检测的边框
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 3.添加 物理仿真行为 到 物理仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

@end
