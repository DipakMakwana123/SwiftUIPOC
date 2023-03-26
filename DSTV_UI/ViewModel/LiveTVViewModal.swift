//
//  LiveTVViewModal.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import Foundation

class LiveTVViewModel: ObservableObject{

    @Published var lists: [HorizontalModel] = [

        HorizontalModel(id: "0",title: "Recently Watched Channels", selected: true, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),

        ]),

        HorizontalModel(id: "1",title: "All Channels", selected: false, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
            
        ]),
        HorizontalModel(id: "2",title: "Cartoon Network",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        HorizontalModel(id: "3",title: "Zee Sports", selected: false, subItems: [
            
            ListItem(title: "Sports",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "4",title: "Ten Sports",  selected: false,subItems: [
            
            ListItem(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "5",title: "Sports TV", selected: false, subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        HorizontalModel(id: "6",title: "All Channels", selected: false, subItems: [
            
            ListItem(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "7",title: "All Channels", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        HorizontalModel(id: "8",title: "All Channels",  selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        HorizontalModel(id: "9",title: "All Channels", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        HorizontalModel(id: "10",title: "All Channels", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),
            
        ])

    ]
}

class TvShowViewModel: ObservableObject{

    @Published var lists: [HorizontalModel] = [

        HorizontalModel(id: "0",title: "All", selected: true, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),

        ]),

        HorizontalModel(id: "1",title: "Box Sets", selected: false, subItems: [
            ListItem(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),

        ]),
        HorizontalModel(id: "2",title: "Drama",selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "3",title: "Comedy", selected: false, subItems: [

            ListItem(title: "Sports",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "4",title: "Soaps",  selected: false,subItems: [

            ListItem(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "5",title: "Reality", selected: false, subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "6",title: "Talk", selected: false, subItems: [

            ListItem(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        HorizontalModel(id: "7",title: "Specials", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "8",title: "Documentary",  selected: false,subItems: [
            ListItem(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "9",title: "Life Styles", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),

        ]),
        HorizontalModel(id: "10",title: "All Channels", selected: false, subItems: [
            ListItem(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),

        ])

    ]
}


