//
//  Coordenadas.swift
//  borrame1
//
//  Created by jesus jaramillo on 15/10/2020.
//  Copyright © 2020 jesus jaramillo. All rights reserved.
//

import Foundation
import CoreLocation

struct datosGps: Codable {
    var GeoJson: [[Double]]?
    var velocidad: [String]?
    var descripcion: String?
    var hora: Date
    var hora_fin:Date
    var velMax: Double
    
    

    mutating func iniciarCoordendas(){
        GeoJson=[]
        velocidad=[]
        hora = Date()
        hora_fin = Date()
        descripcion=""
        velMax = -3
        print("es la hora::::::::::")
        print(hora)
    }
       
    
    mutating func anexarCoordendas(locatione : [CLLocation]){
        
        if(velMax < locatione[0].speed){
            velMax = locatione[0].speed
            print(velMax)
        }
        var auxVel = ""
        //auxGeo.(locatione[0].coordinate.longitude)
        
        auxVel.append(String(format: "%.7f", locatione[0].speed  * 1,94384449)) //pasarlo a nudos
        
        GeoJson?.append([locatione[0].coordinate.longitude,locatione[0].coordinate.latitude]);
        velocidad?.append( auxVel);
   
        
       
        }
    mutating func terminarCoordendas(){
        hora_fin = Date()
        
        

    }
}


