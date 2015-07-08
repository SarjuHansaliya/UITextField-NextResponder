//
//  ViewController.h
//  NextResponder
//
//  Created by sarju hansaliya on 06/07/15.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UITextField *firstName;
@property (nonatomic,strong) IBOutlet UITextField *lastName;
@property (nonatomic,strong) IBOutlet UITextField *userName;
@property (nonatomic,strong) IBOutlet UITextField *password;
@property (nonatomic,strong) IBOutlet UITextField *confPassword;
@property (nonatomic,strong) IBOutlet UITextField *city;
@property (nonatomic,strong) IBOutlet UITextField *state;

@property (nonatomic,strong) IBOutlet UIButton *registerBtn;

@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;

-(IBAction)registerButtonPressed:(id)sender;
@end

