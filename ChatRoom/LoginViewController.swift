//
//  LoginViewController.swift
//  ChatRoom
//
//  Created by Hua David on 2020/1/15.
//  Copyright © 2020 darklit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var accountUITextField: UITextField!
    @IBOutlet weak var passwordUITextField: UITextField!
    @IBOutlet weak var LoginUIButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginUIButtonClick(_ sender: Any) {
        print("gogohell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
