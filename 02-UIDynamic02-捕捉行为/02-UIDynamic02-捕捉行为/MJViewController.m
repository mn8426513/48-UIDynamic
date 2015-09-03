//
//  MJViewController.m
//  02-UIDynamic02-捕捉行为
//
//  Created by apple on 14-5-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic, strong) UIDynamicAnimator *animator;

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
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.iconView snapToPoint:point];
    // 减震
    snap.damping = arc4random_uniform(5)/5.0;
    
    [self.animator removeAllBehaviors]; // 移除之前的所有行为
    [self.animator addBehavior:snap]; // 添加行为
}

@end
