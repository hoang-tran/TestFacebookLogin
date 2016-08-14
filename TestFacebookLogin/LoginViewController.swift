//
//  ViewController.swift
//  TestFacebookLogin
//
//  Created by Hoang Tran on 8/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

  lazy var homeViewController: HomeViewController = {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let secondVC = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
    return secondVC
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    if FBSDKAccessToken.currentAccessToken() != nil {
      goToHomeViewController()
    }
  }

  func goToHomeViewController() {
    self.navigationController?.pushViewController(self.homeViewController, animated: true)
  }

  @IBAction func onTapLoginWithFacebook(sender: AnyObject) {
    let loginManager = FBSDKLoginManager()
    let permissions = ["public_profile"]
    let handler = { (result: FBSDKLoginManagerLoginResult!, error: NSError?) in
      if let error = error {
        print("error = \(error.localizedDescription)")
      } else if result.isCancelled {
        print("cancelled")
      } else {
        print("login successfully")
        self.goToHomeViewController()
      }
    }
    loginManager.logInWithReadPermissions(permissions, fromViewController: self, handler: handler)
  }

}

