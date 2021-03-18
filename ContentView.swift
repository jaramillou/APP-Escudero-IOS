import SwiftUI
import WebKit

var auth: String = "vacio"


let url_formacion = URL(string: "https://escudero-windsurf.herokuapp.com")!
let url_formacion_ = URL(string:"http://192.168.1.104:3000")!

let url_envio_formacion = URL(string: "https://escudero-windsurf.herokuapp.com/envio")!
let url_envio_formacion_ = URL(string: "http://192.168.1.104:3000/envio")!


struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            VStack(){
                
                WebView(request: URLRequest(url: url_formacion))
                
                
                HStack{
                
                    NavigationLink(destination: vistaRecord(token: auth)) {
                        Image(systemName: "play.fill")
                            .font(.largeTitle)
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}


class Coordinator : NSObject, WKNavigationDelegate {
    // ... any other code
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
        
        webView.evaluateJavaScript("localStorage.getItem('token')") { (token, error) in
            if let error = error {
                print ("localStorage.getitem('token') failed due to ************\(error)")
                assertionFailure()
            }
            print("token*******didfinish******* = ")
            print(token)
            if(token != nil){
                auth=token as? String ?? "token todavía vacio" //?? = asignacion cuando es null
            }
            
        }
    }
}




struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
          let webview = WKWebView()
          webview.navigationDelegate = context.coordinator
          return webview
      }
    func makeCoordinator() -> Coordinator {
            Coordinator()
        }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
         
         
        
        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
