
#import "JAPositionConstraint.h"

@interface JAPositionConstraint ()

@property (nonatomic) NSLayoutConstraint *constraintX;
@property (nonatomic) NSLayoutConstraint *constraintY;

@property (nonatomic, weak, readwrite) UIView *view;

@end

@implementation JAPositionConstraint

- (instancetype)initWithView:(UIView*)view inSuperview:(UIView*)superview atPoint:(CGPoint)point
{
    if (self = [super init]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:view];
        
        self.constraintX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:point.x];
        self.constraintY = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:point.y];
        
        [superview addConstraint:self.constraintX];
        [superview addConstraint:self.constraintY];
        
        self.view = view;
    }
    
    return self;
}

- (void)setX:(CGFloat)x
{
    self.constraintX.constant = x;
}

- (CGFloat)x
{
    return self.constraintX.constant;
}

- (void)setY:(CGFloat)y
{
    self.constraintY.constant = y;
}

- (CGFloat)y
{
    return self.constraintY.constant;
}

- (void)setPosition:(CGPoint)position
{
    self.x = position.x;
    self.y = position.y;
}

- (CGPoint)position
{
    return CGPointMake(self.x, self.y);
}

- (NSArray*)constraints
{
    return @[self.constraintX, self.constraintY];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ for view %@ has position %@", [super description], self.view, NSStringFromCGPoint(self.position)];
}

@end
