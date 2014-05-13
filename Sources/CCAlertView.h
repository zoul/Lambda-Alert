extern NSString *const CCAlertViewDismissAllAlertsNotification;
extern NSString *const CCAlertViewAnimatedKey;

@interface CCAlertView : NSObject

@property(nonatomic, assign) UIAlertViewStyle alertViewStyle;
@property(copy) dispatch_block_t dismissAction;
@property (copy, nonatomic) BOOL (^shouldEnableFirstOtherButtonBlock) (void);

- (id) initWithTitle: (NSString*) title message: (NSString*) message;
- (id) initWithTitle: (NSString*) title message: (NSString*) message cancelButtonTitle:(NSString*)cancelButtonTitle cancelButtonBlock:(dispatch_block_t)cancelButtonBlock firstOtherButtonTitle:(NSString*)firstOtherButtonTitle firstOtherButtonBlock:(dispatch_block_t)firstOtherButtonBlock;
- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

- (void) show;
- (void) dismissAnimated: (BOOL) animated;

- (UITextField*) textFieldAtIndex: (NSInteger) textFieldIndex;

@end
