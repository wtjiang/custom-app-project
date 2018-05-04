//
//  LogInViewController.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/2/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userEmail = ""
    var userPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self as? UITextFieldDelegate
        self.passwordTextField.delegate = self as? UITextFieldDelegate
        
        // Do any additional setup after loading the view.
    }
    @IBAction func logInPressed(_ sender: UIButton) {
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
    }
    

}
