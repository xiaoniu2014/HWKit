//
//  NSLayoutConstraint+JMCAdd.m
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import "NSLayoutConstraint+JMCAdd.h"

@implementation NSLayoutConstraint (JMCAdd)

- (instancetype)jmc_updateMultiplier:(CGFloat)multiplier {
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondItem attribute:self.secondAttribute multiplier:multiplier constant:self.constant];
    [newConstraint setPriority:self.priority];
    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    newConstraint.active = true;
    
    [NSLayoutConstraint deactivateConstraints:[NSArray arrayWithObjects:self, nil]];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:newConstraint, nil]];
    return newConstraint;
}

@end
