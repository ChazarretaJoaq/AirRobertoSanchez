//
//  PostListView.swift
//  RobertoSanchez
//
//  Created by gustavo joaquin chazarreta on 30/06/2023.
//

import SwiftUI

struct PostListView : View{
    @State var selectedPost : Post? = nil
    //    @State var isDetailShown = false
    @State var isAnimating = false
    @Namespace var namespace
    var body: some View{
        // muestra en pantalla
        ZStack{
            //CARD VIEW
            
            VStack(spacing: 20){
                ForEach(posts){ post in
                    if post.id != selectedPost?.id{
                        VStack{
                            PostView(posts: post)
                                .matchedGeometryEffect(id: post.id, in:namespace)
                                .frame(width: 330, height: 250)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedPost = post
                                        isAnimating = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                            isAnimating = false
                                        }
                                    }
                                }
                                .disabled(isAnimating)
                        }
                        .matchedGeometryEffect(id: "Container\(post.id)", in: namespace)
                    }
                    else{
                        Color.clear.frame(width: 330, height: 250)
                    }
                }
            }
            .zIndex(1)
            
            //Detail View
            if let selectedPost = selectedPost{
                ZStack(alignment: .topTrailing){
                    VStack{
                        ScrollView{
                            PostView(posts:  selectedPost)
                                .matchedGeometryEffect(id: selectedPost.id, in:namespace)
                                .frame(height: 300)
                            Text("""
                                Roberto Sanchez Style
                                WELCOME TO MY WORLD
                                """
                            )
                            .font(.callout)
                            .padding()
                        }
                    }
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    .matchedGeometryEffect(id: "Container\(selectedPost.id)", in: namespace)
                    
                    Button(action:{
                        withAnimation(.spring()){
                            self.selectedPost = nil
                            isAnimating = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                isAnimating = false
                            }
                        }
                    }){
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .disabled(isAnimating)
                }
                .edgesIgnoringSafeArea(.all)
                .transition(.hero)
                .zIndex(2)
            }
        }

        }
    }
    

struct PostListView_Previews: PreviewProvider{
    static var previews: some View{
        PostListView()
    }
}
