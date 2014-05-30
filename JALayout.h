
#import <Foundation/Foundation.h>
#import "JAPositionConstraint.h"
#import "JASizeConstraint.h"

@interface JALayout : NSObject

+ (void)stretchView:(UIView*)view toFillView:(UIView*)superview;
+ (JAPositionConstraint*)positionView:(UIView*)view inView:(UIView*)superview atPoint:(CGPoint)point;
+ (JASizeConstraint*)sizeView:(UIView*)view toSize:(CGSize)size;

@end

@interface UIView (PXLayout)

/* For Subviews */
- (void)addSubviewAndStretchToFill:(UIView*)view;
- (void)insertSubviewAndStretchToFill:(UIView *)view aboveSubview:(UIView *)siblingSubview;
- (void)compressSizeTo:(CGSize)size;

/* For that view */
- (void)centerHorizontallyInSuperview;
- (void)centerVerticallyInSuperview;
- (void)centerInSuperview;

@end