
#import "JACenterPositionConstraint.h"

@interface JACenterPositionConstraint ()

@property (nonatomic) NSLayoutConstraint *constraintX;
@property (nonatomic) NSLayoutConstraint *constraintY;

@property (nonatomic, weak, readwrite) UIView *view;

@property (nonatomic) NSMutableArray *stack;

@end

static const float MAX_STACK = 50;

@implementation JACenterPositionConstraint

- (instancetype)initWithView:(UIView*)view inSuperview:(UIView*)superview atPoint:(CGPoint)point
{
    if (self = [super init]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:view];
        
        self.constraintX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:point.x];
        self.constraintY = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:point.y];
        
        self.stack = [NSMutableArray array];
        self.view = view;
    }
    
    return self;
}

- (void)setX:(CGFloat)x
{
    [self setPosition:CGPointMake(x, self.position.y)];
}

- (CGFloat)x
{
    return self.constraintX.constant;
}

- (void)setY:(CGFloat)y
{
    [self setPosition:CGPointMake(self.position.x, y)];
}

- (CGFloat)y
{
    return self.constraintY.constant;
}

- (void)setPosition:(CGPoint)position
{
    [self.stack addObject:NSStringFromCGPoint(self.position)];  // save
    if ([self.stack count] > MAX_STACK) {
        [self.stack removeObjectAtIndex:0];
    }
    
    self.constraintX.constant = position.x;
    self.constraintY.constant = position.y;
}

- (CGPoint)position
{
    return CGPointMake(self.x, self.y);
}

- (NSArray*)constraints
{
    return @[self.constraintX, self.constraintY];
}

- (void)moveToPreviousPosition
{
    if ([self.stack count]) {
        CGPoint p = CGPointFromString([self.stack lastObject]);
        [self.stack removeLastObject];
        self.constraintX.constant = p.x;
        self.constraintY.constant = p.y;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ for view %@ has position %@", [super description], self.view, NSStringFromCGPoint(self.position)];
}

@end
