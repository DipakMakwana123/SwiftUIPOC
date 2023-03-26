
import SwiftUI

struct HomeView: View {

    let data: [DataModel] = [
        .init(id: "0", sectionTitle: "Top 5", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                      .init(id: "1", name: "Avengers", imageName: "movie"),
                                                      .init(id: "2", name: "Avengers", imageName: "movie"),
                                                      .init(id: "3", name: "Avengers", imageName: "movie"),
                                                      .init(id: "4", name: "Avengers", imageName: "movie"),
                                                      .init(id: "5", name: "Avengers", imageName: "movie"),
                                                      .init(id: "6", name: "Avengers", imageName: "movie")],selected: false),

            .init(id: "1", sectionTitle: "Top 3", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                          .init(id: "1", name: "Avengers", imageName: "movie"),
                                                          .init(id: "2", name: "Avengers", imageName: "movie"),
                                                          .init(id: "3", name: "Avengers", imageName: "movie"),
                                                          .init(id: "4", name: "Avengers", imageName: "movie"),
                                                          .init(id: "5", name: "Avengers", imageName: "movie"),
                                                          .init(id: "6", name: "Avengers", imageName: "movie")],selected: false),

            .init(id: "2", sectionTitle: "Top 3", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                          .init(id: "1", name: "Avengers", imageName: "movie"),
                                                          .init(id: "2", name: "Avengers", imageName: "movie"),
                                                          .init(id: "3", name: "Avengers", imageName: "movie"),
                                                          .init(id: "4", name: "Avengers", imageName: "movie"),
                                                          .init(id: "5", name: "Avengers", imageName: "movie"),
                                                          .init(id: "6", name: "Avengers", imageName: "movie")], selected: false),

            .init(id: "3", sectionTitle: "Top 5", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                          .init(id: "1", name: "Avengers", imageName: "movie"),
                                                          .init(id: "2", name: "Avengers", imageName: "movie"),
                                                          .init(id: "3", name: "Avengers", imageName: "movie"),
                                                          .init(id: "4", name: "Avengers", imageName: "movie"),
                                                          .init(id: "5", name: "Avengers", imageName: "movie"),
                                                          .init(id: "6", name: "Avengers", imageName: "movie")],selected: false),

            .init(id: "4", sectionTitle: "Top 3", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                          .init(id: "1", name: "Avengers", imageName: "movie"),
                                                          .init(id: "2", name: "Avengers", imageName: "movie"),
                                                          .init(id: "3", name: "Avengers", imageName: "movie"),
                                                          .init(id: "4", name: "Avengers", imageName: "movie"),
                                                          .init(id: "5", name: "Avengers", imageName: "movie"),
                                                          .init(id: "6", name: "Avengers", imageName: "movie")],selected: false),
        .init(id: "5", sectionTitle: "Top 3", items: [.init(id: "0", name: "Avengers", imageName: "movie"),
                                                      .init(id: "1", name: "Avengers", imageName: "movie"),
                                                      .init(id: "2", name: "Avengers", imageName: "movie"),
                                                      .init(id: "3", name: "Avengers", imageName: "movie"),
                                                      .init(id: "4", name: "Avengers", imageName: "movie"),
                                                      .init(id: "5", name: "Avengers", imageName: "movie"),
                                                      .init(id: "6", name: "Avengers", imageName: "movie")],selected: false)

    ]
    var body: some View {
        NavigationView {
            TableCollectionView()
                .modifier(NavigationModifier(navTitle: "Home", isLogoHidden: false))
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HorizontalCollectionView: View {
    let data: [DataModel]
    var body: some View{
        ForEach(data) { section in
            Section(header: Text(section.sectionTitle)) {
                ScrollView(.horizontal) {
                    VStack {
                        HStack(spacing: 10) {
                            ForEach(section.items) { item in
                                VStack(){
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 130, height: 160)
                                        .shadow(radius: 10)
                                    Spacer()
                                    Text(item.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

