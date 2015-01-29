//
//  MapController.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//


import UIKit;
import CoreLocation;	//for CLLocationManager
import MapKit;			//for MKMapView


class MapController: UIViewController, CLLocationManagerDelegate {

	let locationManager: CLLocationManager = CLLocationManager(); //find device's latitude and longitude
	let geocoder: CLGeocoder = CLGeocoder();
	
	let container: UIView = UIView();
	let mapView = MKMapView();
	
	init(title: String) {
	println("map init")
		super.init(nibName: nil, bundle: nil);
		self.title = title;	//self.title is the property, title is the parameter
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//screen size
		let sizeRect = UIScreen.mainScreen().applicationFrame;
		let w = sizeRect.size.width;
		let h = sizeRect.size.height;
		
		// set container frame and add to the screen
		container.frame = CGRect(x: 0, y: 0, width: w, height: h)
		view.addSubview(container)
		
		mapView.frame = CGRectMake(0, 0, w, h);
		

		//let mapView: MKMapView = view as MKMapView;
		mapView.mapType = MKMapType.Hybrid;	//default is MKMapTypeStandard
		mapView.scrollEnabled = true;		//default; let user drag
		mapView.zoomEnabled = true;			//default; double tap, pinch, spread
		mapView.showsUserLocation = true;	//if the user is on the map

		locationManager.requestWhenInUseAuthorization();     //Allow "Map" to access your loc...?
		assert(CLLocationManager.locationServicesEnabled()); //Settings -> Privacy -> Location
		locationManager.desiredAccuracy = kCLLocationAccuracyBest; //default; uses power
		locationManager.delegate = self;
		locationManager.startUpdatingLocation();
		
		self.view.addSubview(mapView);
	}

	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
		manager.stopUpdatingLocation();	//save electricity
		
		//last location in the array of locations
		let location: CLLocation = locations[locations.count - 1] as CLLocation;
		println("update Lat \(location.coordinate.latitude)° Long \(location.coordinate.longitude)°");

		/*
		Create a region and put it into the MKMapView.
		2nd argument is height of the region (north-south),
		3rd argument is width of the region (east-west).
		*/
		let meters: CLLocationDistance = 100;	//east-west
		
		//screen size
		let sizeRect = UIScreen.mainScreen().applicationFrame;
		let w = sizeRect.size.width;
		let h = sizeRect.size.height;
		
		// set container frame and add to the screen
		container.frame = CGRect(x: 0, y: 0, width: w, height: h)
		view.addSubview(container)
		
		mapView.frame = CGRectMake(0, 0, w, h);

		
		//let mapView: MKMapView = view as MKMapView;
		println("here1")
		mapView.region = MKCoordinateRegionMakeWithDistance(
			location.coordinate,
			meters * CLLocationDistance(view.bounds.size.height / view.bounds.size.width),
			meters);

		geocoder.reverseGeocodeLocation(location,
			completionHandler: {(placemarks: [AnyObject]!, error: NSError!) in

			if error != nil {
				println("geocoder error: \(error!)");
				return;
			}
			assert(placemarks.count > 0);

			for placemark in placemarks {	//placemark is a CLPlacemark
				println("placemark.subThoroughfare = \(placemark.subThoroughfare)");
				println("placemark.thoroughfare = \(placemark.thoroughfare)");
				let c: CLLocationCoordinate2D = location.coordinate;
				let ns: String = c.latitude  >= 0 ? "N" : "S";
				let ew: String = c.longitude >= 0 ? "E" : "W";

				let pin: Pin = Pin(
					title: placemark.name,
					subtitle: "\(abs(c.latitude))°\(ns) \(abs(c.longitude))°\(ew)",
					coordinate: c);

				self.view.addSubview(self.mapView);
				self.mapView.addAnnotation(pin);
			}
		});
	}

	func locationManager(manager: CLLocationManager!,
		didFailWithError error: NSError!) {
		println("didFailWithError \(error)");
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}
