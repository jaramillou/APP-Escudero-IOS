import SwiftUI
import WebKit
import Foundation


struct vistaRecord: View {
    var token : String
    
    var singleLocalizacionManager:LocalizacionManager = {LocalizacionManager.sharedInstance}()
    @State private var start = false
    @State private var stop = true
    @State private var color = Color.blue
    var body: some View {
        
        VStack{
            Text ("Auth = \(auth)")
            Button(action: {//ACTIVAMOS LA LOCALIZACION***********************
                
                if (!start) {
                    singleLocalizacionManager.start()
                    print("grabando")
                    color=Color.red
                    start=true
                }
            }) {
                Image(systemName: "play.fill")
                    
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20.0)
                    .foregroundColor(color)
            }
            //Spacer()
            Button(action: {
                start=false
                color=Color.blue
                print("stopppppppppppp")
                singleLocalizacionManager.stop()
  
                print("stop")
                
            }) {
                Image(systemName: "stop.fill").resizable()
                    .frame(width: 50, height: 50)
                    .padding(20.0)
            }
        }
        //Spacer()
        NavigationLink(destination: ContentView()) {
            Text("Guardar y enviar")
                .frame(width: 150, height: 50)
                .padding(20.0)
        }.simultaneousGesture(TapGesture().onEnded{
            print("enviando")
            singleLocalizacionManager.coord.terminarCoordendas()
            
            let jsono = singleLocalizacionManager.coord
            
            ///+++++falta guardar+++++++++
            
            //let jsonData = jsono.data(using: .utf8)
            print(jsono)
           
            
            //let aux_ini = jsono.hora
           // let aux_fin = jsono.hora_fin
            let jsonData = jsonEncod(cor: jsono)//rompe la hora :((
            

            // create post request
            let url = url_envio_formacion //++++++++++++direccion de envio
           

            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.setValue(auth, forHTTPHeaderField: "authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            // insert json data to the request
            request.httpBody = jsonData
            
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
            }
            task.resume()
            
            
        })
        
        
    }
}

func jsonEncod(cor : datosGps) -> Data{
    let jsonEncoder = JSONEncoder()
    let formatoFecha = DateFormatter()
    formatoFecha.dateFormat = "YYYY/MM/dd hh:mm:ss"
    //formatoFecha.dateStyle = .full
    //formatoFecha.timeStyle = .full
    jsonEncoder.dateEncodingStrategy = .formatted(formatoFecha)
    
    let data = try! jsonEncoder.encode(cor)
   // let data = try! JSONEncoder().encode(cor)
    print("data************************:  ")
    let jsonString = String(data: data, encoding: .utf8)
    print(jsonString)
    return data
}

