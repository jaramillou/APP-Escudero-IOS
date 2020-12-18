import SwiftUI
import WebKit

struct vistaRecord: View {
    var singleLocalizacionManager:LocalizacionManager = {LocalizacionManager.sharedInstance}()
    @State private var start = false
    @State private var stop = true
    @State private var color = Color.blue
    var body: some View {
        
        VStack{
            
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
            let jsono = singleLocalizacionManager.coord.GeoJson
            ///+++++falta guardar+++++++++
            
            let jsonData = jsono.data(using: .utf8)
            
            // create post request
            let url = URL(string: "https://escudero-windsurf.herokuapp.com/envio")!
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
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
