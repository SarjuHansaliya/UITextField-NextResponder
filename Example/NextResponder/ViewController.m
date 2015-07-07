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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNextResponders];
    // Do any additional setup after loading the view, typically from a nib.
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    UIView *responder = textField.nextResponderView;
    
    if ([responder isKindOfClass:[UITextField class]]) {
        //Move to next textfield
        
        [(UITextField*)responder becomeFirstResponder];
    }else if ([responder isKindOfClass:[UIButton class]]){
        //In case of last textfield "Done" event.
        //We will press Register button programatically when user press Done button in keyboard in last textfield.
        [(UIButton*)responder sendActionsForControlEvents:UIControlEventTouchUpInside];
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



@end
