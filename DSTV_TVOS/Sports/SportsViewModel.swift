//
//  SportsViewModel.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 24/03/23.
//

import Foundation

class SportsViewModel: ObservableObject{

    @Published var lists: [HorizontalModel] = [

        HorizontalModel(id: "0",title: "All", selected: true, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
        ]),
        HorizontalModel(id: "1",title: "DStv Premiership", selected: false, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
        ]),
        HorizontalModel(id: "2",title: "Premier League",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "3",title: "Football", selected: false, subItems: [
            ListItem(title: "Sports",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "4",title: "Rugby", selected: true, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
        ]),
        HorizontalModel(id: "5",title: "Cricket", selected: false, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
        ]),
        HorizontalModel(id: "6",title: "Basketball",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
        ]),
        HorizontalModel(id: "7",title: "Athelitics",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
        ]),
    ]
}
