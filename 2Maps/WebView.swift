//
//  WebView.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//

import UIKit

class WebView: UIWebView {
	
	init(viewController: GoogleController) {
		// Initialization code
		super.init(frame: CGRectZero);

		backgroundColor = UIColor.grayColor();
		
	}
	
	required init(coder aDecoder: NSCoder){
		super.init(coder: aDecoder);
	}
	
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
  //  override func drawRect(rect: CGRect) {
        // Drawing code
		
  //  }

}
