//
//  Coordenadas.swift
//  borrame1
//
//  Created by jesus jaramillo on 15/10/2020.
//  Copyright © 2020 jesus jaramillo. All rights reserved.
//

import Foundation
import CoreLocation



class Coordenadas {
    var GeoJson = "{ \"type\" : \"LineString\",\n \"coordinates\": [\n";

    
    init(){
    
    //var GeoJson: [String ]=[];
    //o-lGeoJson.append("scs");
    //GeoJson.append("[\n")
    var coordinates: [String ]=[] ;
    }
    
   
       /*
        locatione.forEach { coord in print(coord.coordinate.latitude)}
        //aux = String(format: "%.7f", GeoJson.append(coordinates.last! ))
        self.coordinates.append(aux )
       // GeoJson.append(coordinates.last! )
        aux = String(format: "%.7f", locatione[0].coordinate.longitude)
        self.coordinates.append(aux)
       // print(coordinates)
        //GeoJson.append(coordinates.last! )
        print(GeoJson)
       */
    
        func anexarCoordendas(locatione : [CLLocation]){
            GeoJson.append("[")
            GeoJson.append(String(format: "%.7f", locatione[0].coordinate.longitude))
            GeoJson.append(",")
            GeoJson.append(String(format: "%.7f", locatione[0].coordinate.latitude))
            GeoJson.append("],\n")
            //print(GeoJson)
        }
    func terminarCoordendas(){
        //GeoJson.remove(at: GeoJson.removeLast())
        GeoJson.removeLast(2)
        GeoJson.append("]}")
        //falta controlar cuando se le da al stop / play varias veces
        print(GeoJson)
    }
}
