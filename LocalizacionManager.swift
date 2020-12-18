//
//  localizacionManager.swift
//  borrame1
//
//  Created by jesus jaramillo on 26/08/2020.
//  Copyright © 2020 jesus jaramillo. All rights reserved.
//

import CoreLocation

class LocalizacionManager: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var coord =  Coordenadas()
    private var contador = 0
    private var vectorLocation = [CLLocation]()
    static let sharedInstance = LocalizacionManager()
 
        
    
    
 
    
    
      override init() {
        super.init()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.requestWhenInUseAuthorization()
        //no compatible con iwatch
        locationManager.allowsBackgroundLocationUpdates = true
       locationManager.pausesLocationUpdatesAutomatically = false
       // locationManager.startUpdatingLocation()  //mejor lo ponemos en star
        self.checkLocationAuthorization()
        
        //print("hola mundo")

       
    }
    
    func start(){
        coord = Coordenadas.init()
        locationManager.startUpdatingLocation()
    }
    func stop(){
        locationManager.stopUpdatingLocation()
        coord.terminarCoordendas()
        
    }
    
    
    func checkLocationAuthorization() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                print("authorizedWhenInUse")
                break
            case .denied:
                print("denied")
                // Show alert instructing them how to turn on permissions
                break
            case .notDetermined:
                 print("no degtermined")
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                 print("restricted")
                // Show an alert letting them know what's up
                break
            case .authorizedAlways:
                 print("siempre autorizado")
                break
            
            
           default:
                print("valor desconocido de autorizacion")
                break
        }
        
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         
        
        coord.anexarCoordendas(locatione: locations as [CLLocation] )
        print("tamaño de locations: ")
        print( locations.count )
        //print( locations.first?.coordinate.latitude)

       //NSLog("%@", locations)
        
    


    }
    
    
        
    

    
}

