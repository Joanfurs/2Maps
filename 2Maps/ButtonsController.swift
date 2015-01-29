//
//  ButtonsController.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//

import UIKit

class ButtonsController: UIViewController {

  init(title: String) {
		super.init(nibName: nil, bundle: nil);
		self.title = title;	//self.title is the property, title is the parameter
	}

	//not called
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
	}

	override func loadView() {
		view = Buttons(viewController: self);
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func google(button: UIButton!) {
	println("button pressed")
		let mainController: MainController = self.navigationController! as MainController;
		mainController.next();
	}
	
	func map(button1: UIButton!) {
	println("button pressed")
		let mainController: MainController = self.navigationController! as MainController;
		mainController.next1();
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	*/

}