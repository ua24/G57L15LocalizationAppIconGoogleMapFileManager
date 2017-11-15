//
//  MapViewController.swift
//  G57L15
//
//  Created by Ivan Vasilevich on 11/14/17.
//  Copyright © 2017 RockSoft. All rights reserved.
//


import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {
	
	@IBOutlet weak var centerMapView: UIView!
	// You don't need to modify the default init(nibName:bundle:) method.
	
	override func loadView() {
		// Create a GMSCameraPosition that tells the map to display the
		// coordinate -33.86,151.20 at zoom level 6.
		let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
		let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
		view = mapView
		mapView.delegate = self
		mapView.isMyLocationEnabled = true
		
//		// Creates a marker in the center of the map.
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
		marker.title = "Sydney"
		marker.snippet = "Australia"
		marker.map = mapView
		marker.isDraggable = true
		
//		50.4519296,30.4463523
		// Creates a marker in the center of the map.
		let myMarker = GMSMarker()
		myMarker.position = CLLocationCoordinate2D(latitude: 50.4519296, longitude: 30.4463523)
		myMarker.title = "WULYAVKA"
		myMarker.snippet = "WebAcademy"
		myMarker.map = mapView
		
	}
	
	func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
		print(marker.position)
		return true
	}
}
