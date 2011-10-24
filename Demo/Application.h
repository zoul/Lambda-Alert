@interface Application : NSObject <UIApplicationDelegate> {}

@property(strong, nonatomic) IBOutlet UIWindow *window;

- (IBAction) showDemoAlert;
- (IBAction) showDemoActionSheet;

@end
