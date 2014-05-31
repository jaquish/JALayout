
#import <Foundation/Foundation.h>

@interface JAPositionConstraint : NSObject

- (instancetype)initWithView:(UIView*)view inSuperview:(UIView*)superview atPoint:(CGPoint)point;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGPoint position;
@property (nonatomic, weak, readonly) UIView *view;

- (NSArray*)constraints;

- (void)moveToPreviousPosition;

@end
