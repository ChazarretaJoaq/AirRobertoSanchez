//
//  Post.swift
//  RobertoSanchez
//
//  Created by gustavo joaquin chazarreta on 30/06/2023.
//
import SwiftUI

struct Post : Identifiable{
    let id = UUID()
    let tag : String
    let title : String
    let description : String
    let thumbnailName : String
}
let posts = [Post(tag: "", title: "", description: "", thumbnailName: "AirSanchez1"), Post(tag:"",title:"",description:"",thumbnailName:"AirSanchez2" ),Post(tag:"",title:"",description:"",thumbnailName:"AirSanchez3" )  ]
