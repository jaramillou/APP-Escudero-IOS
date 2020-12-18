import SwiftUI
import WebKit



struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            VStack(){
                
                WebView(request: URLRequest(url: URL(string: "https://escudero-windsurf.herokuapp.com")!))
            
                HStack{
                
                    NavigationLink(destination: vistaRecord()) {
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







struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
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

