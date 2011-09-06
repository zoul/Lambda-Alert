@interface Application : NSObject <UIApplicationDelegate> {}

@property(retain, nonatomic) IBOutlet UIWindow *window;

- (IBAction) showDemoAlert;
- (IBAction) showDemoActionSheet;

@end
