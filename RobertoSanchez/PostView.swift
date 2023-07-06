//
//  ContentView.swift
//  RobertoSanchez
//
//  Created by gustavo joaquin chazarreta on 30/06/2023.
//

import SwiftUI

struct PostView: View {
    let posts : Post
    
    var cornerRadius : CGFloat = 20
    let isShadowVisible: Bool = true
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Spacer().frame(height: 30)
                Text(posts.tag)
                    .font(.callout)
                    .fontWeight(.medium)
                
                Text(posts.title)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Text(posts.description)
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        
        .padding()
        .foregroundColor(.black)
        .background(
            Image(posts.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .brightness(-0.15)
                .clipped()
        )
        .cornerRadius(cornerRadius)
        .shadow(radius: 10)
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(posts: posts[0])
    }
}
