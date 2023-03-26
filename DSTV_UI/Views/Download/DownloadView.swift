
import SwiftUI

struct DownloadView: View {
    @ObservedObject private var viewModal =  DownloadViewModal()
    @State var selectedItem: HorizontalModel?

    var body: some View {
        
        NavigationView {
            VStack(spacing: 30){
                HorizontalList(viewModal: viewModal, selectedItem: selectedItem)
                    .frame( height: 40)
                Image("NoDownloadsHero")
                    .resizable()
                Text("Download your favorite shows,movies and sports to watch while you are offline.")
                    .foregroundColor(.white)
                    .zIndex(1)
                btnBrowse()
                    .zIndex(2)
                Spacer()
            }
            .background(Color.black.opacity(0.9))
            .modifier(NavigationModifier(navTitle: "Downloads", isLogoHidden: true))
        }
    }
    private func btnBrowse()-> some View{
        Button(action: {
            print("Browse & Download")
        }) {
            Text("Browse & Download")
                .frame(width: 200,height: 20)
                .font(.system(size: 14))
                .padding()
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
        .background(.white)
        .cornerRadius(25)
    }
}
