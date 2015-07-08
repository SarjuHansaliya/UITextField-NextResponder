//
//  ViewController.m
//  NextResponder
//
//  Created by sarju hansaliya on 06/07/15.
//
//

#import "ViewController.h"
#import "UITextField+NextResponder.h"

@interface ViewController ()
{
    UITextField *activeField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForKeyboardNotifications];
    [self initNextResponders];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGFloat offset  = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y - activeField.frame.origin.y;
        [_scrollView setContentOffset:CGPointMake(0, offset + 40 + activeField.frame.size.height) animated:YES];
    }
}
-(void)keyboardWillBeHidden:(NSNotification*)aNotification{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
}

-(void)initNextResponders{
    
    _firstName.nextResponderView = _lastName;
    _lastName.nextResponderView = _userName;
    _userName.nextResponderView = _password;
    _password.nextResponderView = _confPassword;
    _confPassword.nextResponderView = _city;
    _city.nextResponderView = _state;
    _state.nextResponderView = _registerBtn;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    UIView *responder = textField.nextResponderView;
    
    
    if ([responder isKindOfClass:[UITextField class]]) {
        //Move to next textfield
        [(UITextField*)responder becomeFirstResponder];
        return NO;
    }else if ([responder isKindOfClass:[UIButton class]]){
        //In case of last textfield "Done" event.
        //We will press Register button programatically when user press Done button in keyboard in last textfield.
        [(UIButton*)responder sendActionsForControlEvents:UIControlEventTouchUpInside];
            return YES;
    }
    
    return NO;
}

-(IBAction)registerButtonPressed:(id)sender{
    //Do your logic here
    NSLog(@"Register button pressed.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}

@end
