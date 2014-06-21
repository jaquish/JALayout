
#import <Foundation/Foundation.h>

@interface JACenterPositionConstraint : NSObject

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGPoint position;
@property (nonatomic, weak, readonly) UIView *view;

- (instancetype)initWithView:(UIView*)view inSuperview:(UIView*)superview atPoint:(CGPoint)point;

- (NSArray*)constraints;

- (void)moveToPreviousPosition;

@end
