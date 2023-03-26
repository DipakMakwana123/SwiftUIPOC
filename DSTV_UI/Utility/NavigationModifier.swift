
import SwiftUI

struct NavigationModifier: ViewModifier {
    let navTitle: String
    let isLogoHidden: Bool
    func body(content: Content) -> some View {
        content
        
            .navigationBarTitle(navTitle, displayMode: .inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Colors.black,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(
            leading:
                Button(action: {
                    print("SF Symbol button pressed...")
            }) {
                if !isLogoHidden {
                    Image("logo_blue_now")
                        .resizable()
                }
            },
            trailing:
                    HStack {

                        Button(action: {
                            print("Search Button Pressed")
                        }) {
                            Image(systemName: "gearshape")

                        }.accentColor(Colors.black)
                        Button(action: {
                            print("Search Button Pressed")
                        }) {
                            Image(systemName: "magnifyingglass")

                        }
            })
    }
}
