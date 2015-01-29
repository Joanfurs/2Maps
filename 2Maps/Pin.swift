//
//  Pin.swift
//  2Maps
//
//  Created by Zhanna Fursova on 1/23/15.
//  Copyright (c) 2015 John Doe. All rights reserved.
//


import UIKit;
import MapKit;	//for MKAnnotation and CLLocationCoordinate2D

class Pin: NSObject, MKAnnotation {
	let title: String;
	let subtitle: String;
	let coordinate: CLLocationCoordinate2D;
	
	init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
		self.title = title;	//self.title is the property, title is the parameter
		self.subtitle = subtitle;
		self.coordinate = coordinate;
	}
   
}

