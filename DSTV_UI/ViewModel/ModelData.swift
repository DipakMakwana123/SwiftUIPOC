//
//  ModelData.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 23/12/22.
//

import Foundation
class SearchModal: ObservableObject {
    @Published var text : String = String()
}
// MARK: - Meme
struct Meme: Codable,Identifiable, Hashable {
    let id, name: String?
    let url: String
    let width, height, boxCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
struct Resource {
    var title: String
    var imageName: String
}
struct ListItem: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    let videoURL: String
    let time: String
    let minutes: String
}

struct HorizontalModel: Identifiable {
    var id: String
    var title: String
    var selected: Bool
    var subItems: [ListItem]?
}


/*struct SwiftUIViewModal {

    private let apiManager: APIManager

    var employees:Employee = Employee()

    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }

    func getMemesData(compilation: @escaping ([Meme]) -> ()){
        let urlString = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlString) else {return }


        apiManager.getAPICall(url: url, compilation: {res in

            switch res {
            case.success(let data):
                // parsing data
                guard let response = data?.getModal(modal: RootMeme.self) else {return
                   // compilation(.failure(.parserError))
                }
                compilation(response.data.memes)
            case.failure(let err):
                debugPrint(err.localizedDescription)
                //compilation(.failure(.unknown))
            }
        })

    }


    //    func getData(completion: @escaping ([Meme]) -> ()){
    //        //combineDemo()
    //        let urlString = "https://api.imgflip.com/get_memes"
    //        let serverConfig = APIConfiguration(urlString:  urlString, httpMethod: .get)
    //        apiManager.apiCallWithToken(configuration: serverConfig, completion: {(success,data,response,error) in
    //            guard let jsonData = data else {return}
    //                let memes =  jsonData.getModal(modal: RootMeme.self)
    //                completion(memes?.data.memes ?? [])
    //        })
    //    }
    //
}
*/
