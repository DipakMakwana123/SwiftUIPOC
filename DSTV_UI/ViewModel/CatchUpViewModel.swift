//
//  CatchUpViewModel.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 28/12/22.
//

import Foundation

class CatchUpViewModel: ObservableObject{

    //@Published var selectedItem =  HorizontalModel(selected: false)

    @Published var lists: [HorizontalModel] = [

        HorizontalModel(id: "0", title: "Featured", selected: true, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),

        ]),

        HorizontalModel(id: "1",title: "TV Shows", selected: false, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),

        ]),
        HorizontalModel(id: "2",title: "Movies",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "3",title: "Kids", selected: false, subItems: [

            ListItem(title: "Sports",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "4",title: "Sport",  selected: false,subItems: [

            ListItem(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ])
        ]
}
