//
//  ViewController.swift
//  MapasProyecto
//
//  Created by Raul Armas Santiago on 10/11/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//Para acceder al mapa tenemos que configurar el info.plis con las ultimas dos caracteristicas configuradas de este proyecto Privacy - Location Always and When In Use Usage Description && Privacy - Location When In Use Usage Description	

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapaOutlet: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapaOutlet.showsUserLocation = true
        self.locationManager.requestAlwaysAuthorization() // Permisos para acceder a l gp
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // Obtenga la mayor precision posible
            locationManager.startUpdatingLocation()
        } else {
            print("Enciende tu GPS")
        }
    
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapaOutlet.setRegion(region, animated: true)
        
        guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("Location: \(location.latitude) \(location.longitude)")
        
        
    }


}

