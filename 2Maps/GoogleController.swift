//
//  GoogleController.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//

import UIKit
import CoreLocation;	//for CLLocationManager

class GoogleController:  UIViewController, UIWebViewDelegate, CLLocationManagerDelegate {


	let locationManager: CLLocationManager = CLLocationManager(); //find device's latitude and longitude
	var lat: Double
	var lon: Double

	init(title: String) {
	println("google init")
	self.lat = 40.7332571503154
	self.lon = -73.9751828928236
		super.init(nibName: nil, bundle: nil);
		self.title = title;	//self.title is the property, title is the parameter
	}
	
	required init(coder aDecoder: NSCoder) {
	self.lat = 40.7332571503154
	self.lon = -73.9751828928236
		super.init(coder: aDecoder);
	}
	
	override func loadView() {
		view = WebView(viewController: self);
	}

	override func viewDidLoad() {
		super.viewDidLoad();
		println("before web view")
		// Do any additional setup after loading the view, typically from a nib.
		let webView: UIWebView = view as UIWebView;
		println("before delegate")
		webView.delegate = self;
		println("after delegate")
		
		let bundle: NSBundle = NSBundle.mainBundle();
		let filename: String? = bundle.pathForResource("javascript", ofType: "html");

		if filename == nil {
			webView.loadHTMLString("could not find file javascript.html", baseURL: nil);
		} else {
			let data: NSData? = NSData(contentsOfFile: filename!);
			if data == nil {
				webView.loadHTMLString("could not load file javascript.html", baseURL: nil);
			} else {
				webView.loadData(data,
					MIMEType: "text/html",
					textEncodingName: "utf-8",
					baseURL: NSURL(string:"http://maps.google.com/"));
			}
		}
		
		self.view = webView;
		
		locationManager.requestWhenInUseAuthorization();     //Allow "Map" to access your loc...?
		assert(CLLocationManager.locationServicesEnabled()); //Settings -> Privacy -> Location
		locationManager.desiredAccuracy = kCLLocationAccuracyBest; //default; uses power
		locationManager.delegate = self;
		locationManager.startUpdatingLocation();
		
	}
	
	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
		manager.stopUpdatingLocation();	//save electricity
		
		//last location in the array of locations
		let location: CLLocation = locations[locations.count - 1] as CLLocation;
		println("update Lat \(location.coordinate.latitude)° Long \(location.coordinate.longitude)°");

		//let lat = "\(location.coordinate.latitude)"
		//let lon = "\(location.coordinate.longitude)"
		
		let lat = location.coordinate.latitude
		let lon = location.coordinate.longitude
	}

	func locationManager(manager: CLLocationManager!,
		didFailWithError error: NSError!) {
		println("didFailWithError \(error)");
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {

		let javascript: String = String(format: "showmap(%.15g, %.15g, %d);", lat, lon,
			//163 William Street, New York, NY
			//40.7101843,    //latitude (north of equator is positive)
			//-74.0061474,   //longitude (west of Greenwich is negative)
			18);           //zoom level
		
		println("javaScript = \"\(javascript)\"");
	
		let retval: String? = webView.stringByEvaluatingJavaScriptFromString(javascript);
		if retval == nil {
			println("stringByEvaluatingJavaScriptFromString failed");
		} else {
			println("retval! = \(retval!)");
			let n: Int? = retval!.toInt();
			if n == nil {
				println("retval! \(retval!) is not an Int");
			} else {
				println("n! = \(n!)");
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning();
		// Dispose of any resources that can be recreated.
	}


}
