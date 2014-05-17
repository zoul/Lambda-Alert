extern NSString *const CCAlertViewDismissAllAlertsNotification;
extern NSString *const CCAlertViewAnimatedKey;

/**
 A simple `UIAlertView` wrapper with blocks-based API.
 The memory management works as in `UIAlertView`: you don’t have
 to hold a strong reference to a `CCAlertView`, it will retain
 itself when it’s displayed and release after being dismissed.
*/
@interface CCAlertView : NSObject

/**
 Alert style, see `UIAlertViewStyle` for details.

 The alert style can be used to show a textfield in the alert.
*/
@property(nonatomic, assign) UIAlertViewStyle alertViewStyle;

/** Block to be called after the alert is dismissed by whatever means. */
@property(copy) dispatch_block_t dismissAction;

/** Both the title and the message may be `nil`. */
- (id) initWithTitle: (NSString*) title message: (NSString*) message;

/** Adds button with given title and action. The action may be `nil`. */
- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

/** Display the alert. */
- (void) show;

/** Dismiss the alert. Calls `dismissAction` if set. */
- (void) dismissAnimated: (BOOL) animated;

/**
 Returns a pointer to a textfield, if present.

 The only supported way to get a textfield in the alert
 is by setting the `alertViewStyle` property.
*/
- (UITextField*) textFieldAtIndex: (NSInteger) textFieldIndex;

@end
