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

class ViewController: UIViewController {

	@IBOutlet weak var subtitleLabel: UILabel!
	
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
