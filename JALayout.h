
#import <Foundation/Foundation.h>
#import "JACenterPositionConstraint.h"
#import "JASizeConstraint.h"

@interface JALayout : NSObject

+ (void)stretchView:(UIView*)view toFillView:(UIView*)superview;
+ (JACenterPositionConstraint*)positionView:(UIView*)view inView:(UIView*)superview atPoint:(CGPoint)point;
+ (JASizeConstraint*)sizeView:(UIView*)view toSize:(CGSize)size;

@end

@interface UIView (JALayout)

/* From perspective of superview */
- (void)addSubviewAndStretchToFill:(UIView*)view;
- (void)insertSubviewAndStretchToFill:(UIView *)view aboveSubview:(UIView *)siblingSubview;
- (void)insertSubviewAndStretchToFill:(UIView *)view atIndex:(NSInteger)index;
- (void)insertSubviewAndStretchToFill:(UIView *)view belowSubview:(UIView *)siblingSubview;

/* From perspective of subview */
- (void)centerHorizontallyInSuperview;
- (void)centerVerticallyInSuperview;
- (void)centerInSuperview;
- (void)compressSizeTo:(CGSize)size;

@end