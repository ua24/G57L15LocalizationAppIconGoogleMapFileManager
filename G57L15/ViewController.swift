//
//  ViewController.swift
//  G57L15
//
//  Created by Ivan Vasilevich on 11/14/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import AccountKit

class ViewController: UIViewController {

	@IBOutlet weak var subtitleLabel: UILabel!
	
	var _accountKit: AKFAccountKit!
	var _pendingLoginViewController: AKFViewController!
	var _authorizationCode: String!
	
	let subtitleText = NSLocalizedString("subtitleKey", comment: "subtitle on map screen")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		subtitleLabel.text = subtitleText//"you can"
		
//		let path = Bundle.main.path(forResource: "Podfile2", ofType: nil)
//		print(path)
//		let fileManager = FileManager.default
//		let documentDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
//		let fileURL = documentDirectory.appendingPathComponent("filename.extension")
		
		let loginButton = FBSDKLoginButton()
		loginButton.delegate = self
		// Optional: Place the button in the center of your view.
		loginButton.center = self.view.center;
		self.view.addSubview(loginButton)
		
		// Do any additional setup after loading the view.
		_accountKit = AKFAccountKit.init(responseType: .accessToken)
		let number = AKFPhoneNumber.init(countryCode: "+380", phoneNumber: "930736656")
		_pendingLoginViewController = _accountKit.viewControllerForPhoneLogin(with: number, state: "Ukraine")
		_pendingLoginViewController = _accountKit.viewControllerForPhoneLogin(with: number, state: "Ukraine")//_accountKit.viewControllerForEmailLogin(withEmail: "ua2345@gmail.com", state: "Ukraine")
		print(_pendingLoginViewController)
		
	}

	@IBAction func smsLogin(_ sender: Any) {
		_pendingLoginViewController.delegate = self
		present(_pendingLoginViewController as! UIViewController, animated: true, completion: nil)
	}
	
	@IBAction func verificateEmail(_ sender: Any) {
		_pendingLoginViewController = _accountKit.viewControllerForEmailLogin(withEmail: "ua2345@gmail.com", state: "Ukraine")
		present(_pendingLoginViewController as! UIViewController, animated: true, completion: nil)
	}
	
	
}

extension ViewController: AKFViewControllerDelegate {
	func viewController(_ viewController: (UIViewController & AKFViewController)!, didCompleteLoginWith accessToken: AKFAccessToken!, state: String!) {
		print(accessToken)
	}
}



extension ViewController: FBSDKLoginButtonDelegate {
	func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
		
	}
	

	func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
		print(result)
		print(result)
	}
}
