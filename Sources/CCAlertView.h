extern NSString *const CCAlertViewDismissAllAlertsNotification;
extern NSString *const CCAlertViewAnimatedKey;

@interface CCAlertView : NSObject

@property(nonatomic, assign) UIAlertViewStyle alertViewStyle;
@property(copy) dispatch_block_t dismissAction;

- (id) initWithTitle: (NSString*) title message: (NSString*) message;
- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

- (void) show;
- (void) dismissAnimated: (BOOL) animated;

- (UITextField*) textFieldAtIndex: (NSInteger) textFieldIndex;

@end
