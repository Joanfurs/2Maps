//
//  MainController.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//

import UIKit

class MainController: UINavigationController {

   let titles: [String] = [
   		"Buttons",
		"Google",
		"Map"];

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		toolbarHidden = true;
		let startController: ButtonsController = ButtonsController(title: titles[0]);
		pushViewController(startController, animated: false);
		println("but")
	}
	
	func next() {
			println("push google")
			let firstController: GoogleController =
				GoogleController(title: titles[1]);
			pushViewController(firstController, animated: true);
		
		
	}

	func next1() {
		println("push map")
			let secondController: MapController =
				MapController(title: titles[2]);
			pushViewController(secondController, animated: true);
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
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