//
//  SecondViewController.swift
//  TestFacebookLogin
//
//  Created by Hoang Tran on 8/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class HomeViewController : UIViewController {

  @IBAction func onTapLogoutButton(sender: AnyObject) {
    let loginManager = FBSDKLoginManager()
    loginManager.logOut()
    self.navigationController?.popViewControllerAnimated(true)
  }

}