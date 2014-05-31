
#import "JALayout.h"

@implementation JALayout

+ (void)stretchView:(UIView*)view toFillView:(UIView*)superview
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [superview addSubview:view];
    [superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":view}]];
    [superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":view}]];
}

+ (JAPositionConstraint*)positionView:(UIView*)view inView:(UIView*)superview atPoint:(CGPoint)point
{
    JAPositionConstraint *positionConstraint = [[JAPositionConstraint alloc] initWithView:view inSuperview:superview atPoint:point];
    return positionConstraint;
}

+ (JASizeConstraint*)sizeView:(UIView*)view toSize:(CGSize)size
{
    JASizeConstraint *sizeConstraint = [[JASizeConstraint alloc] initWithView:view size:size];
    [view.superview setNeedsLayout];
    return sizeConstraint;
}

@end

@implementation UIView (JALayout)

#pragma Mark - Public

- (void)addSubviewAndStretchToFill:(UIView*)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    [self stretchView:view];
}

- (void)insertSubviewAndStretchToFill:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:view aboveSubview:siblingSubview];
    [self stretchView:view];
}

- (void)insertSubviewAndStretchToFill:(UIView *)view atIndex:(NSInteger)index
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:view atIndex:index];
    [self stretchView:view];
}

- (void)insertSubviewAndStretchToFill:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self insertSubview:view belowSubview:siblingSubview];
    [self stretchView:view];
}

- (void)compressSizeTo:(CGSize)size
{
    [self addConstraints:[JALayout sizeView:self toSize:size].constraints];
}

- (void)centerHorizontallyInSuperview
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.superview addConstraint:constraint];
}

- (void)centerVerticallyInSuperview
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.superview addConstraint:constraint];
}

- (void)centerInSuperview
{
    [self centerHorizontallyInSuperview];
    [self centerVerticallyInSuperview];
}

#pragma mark - Helpers

- (void)stretchView:(UIView*)view
{
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":view}]];
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":view}]];
}

@end
