//
//  Buttons.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//

import UIKit

class Buttons:  UIView {

  // let viewController: ButtonsController;

	init(viewController: ButtonsController) {
		//self.viewController = viewController;
		super.init(frame: CGRectZero);
		backgroundColor = UIColor.whiteColor();
		//Call drawRect whenever orientation changes.
		contentMode = UIViewContentMode.Redraw;
		
		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button.titleLabel!.font = UIFont.systemFontOfSize(UIFont.buttonFontSize());
		let title: String = " Google map ";
		button.bounds.size = title.sizeWithAttributes([NSFontAttributeName: button.titleLabel!.font]);
		button.bounds.size.height *= 2;	//Looks better if we double the height.
		
		button.frame.origin = CGPointMake(50, 150)
		
		button.backgroundColor = UIColor.whiteColor();
		button.layer.borderWidth = 0.5;	//0.5 pairs of pixels = 1 pixel
		button.layer.borderColor = UIColor.blackColor().CGColor;
		button.setTitle(title, forState: UIControlState.Normal);

		button.addTarget(viewController,
			action: "google:",
			forControlEvents: UIControlEvents.TouchUpInside);

		addSubview(button);
		
		let button1: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button1.titleLabel!.font = UIFont.systemFontOfSize(UIFont.buttonFontSize());
		let title1: String = " Your location  ";
		button1.bounds.size = title1.sizeWithAttributes([NSFontAttributeName: button1.titleLabel!.font]);
		button1.bounds.size.height *= 2;	//Looks better if we double the height.
		
		button1.frame.origin = CGPointMake(50, 250)
		
		button1.backgroundColor = UIColor.whiteColor();
		button1.layer.borderWidth = 0.5;	//0.5 pairs of pixels = 1 pixel
		button1.layer.borderColor = UIColor.blackColor().CGColor;
		button1.setTitle(title1, forState: UIControlState.Normal);

		button1.addTarget(viewController,
			action: "map:",
			forControlEvents: UIControlEvents.TouchUpInside);

		addSubview(button1);
		
	}
	

	//not called
	required init(coder aDecoder: NSCoder) {
		//viewController = ButtonsController(title: "");
		super.init(coder: aDecoder);
	}

	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.

	override func drawRect(rect: CGRect) {
		// Drawing code
	}
	*/

}