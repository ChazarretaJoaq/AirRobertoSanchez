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
    @State var isNavigationBarHidden = false // Agregar estado para controlar la visibilidad del NavigationBar
    
    var body: some View{
        NavigationView{
            
            // muestra en pantalla
            ZStack{
                //CARD VIEW
                Color.black.edgesIgnoringSafeArea(.all) // Fondo blanco para evitar que se vea detrás del NavigationBar
                
                VStack(spacing: 10){
                    Spacer()
                    ForEach(posts){ post in
                        if post.id != selectedPost?.id{
                            VStack{
                                Spacer()
                                PostView(posts: post)
                                    .matchedGeometryEffect(id: post.id, in:namespace)
                                    .frame(width: 330, height: 240)
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            selectedPost = post
                                            isAnimating = true
                                            isNavigationBarHidden = true // Ocultar el NavigationBar al tocar la imagen
                                            
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
                    Divider()
                    FooterView()
                        .padding()
                }
                .padding()
                .zIndex(1)
                .navigationBarTitle("Air Sanchez", displayMode: .inline)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: sidebarButton)
                .navigationBarItems(trailing: settingsButton)
                .navigationBarHidden(isNavigationBarHidden) // Controlar la visibilidad del NavigationBar
                
                //Detail View
                if let selectedPost = selectedPost{
                    ZStack(alignment: .topTrailing){
                        VStack{
                            Spacer()
                            Spacer()
                            Spacer()

                        }
                        VStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            ScrollView{
                                PostView(posts:  selectedPost)
                                    .matchedGeometryEffect(id: selectedPost.id, in:namespace)
                                    .frame(height: 350)
                                Text("""
                                    Roberto Sanchez Style
                                    WELCOME TO MY WORLD
                                    """
                                )
                                .font(.custom("Times New Roman", size: 36).bold())
                                .padding()
                            }
                        }
                        
                        Button(action:{
                            withAnimation(.spring()){
                                self.selectedPost = nil
                                isAnimating = true
                                isNavigationBarHidden = false // Mostrar el NavigationBar al cerrar la vista de detalle
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    isAnimating = false
                                }
                            }
                        }){
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                                .foregroundColor(.black)
                            
                        }
                        .padding()
                        .disabled(isAnimating)
                        .onDisappear {
                            isNavigationBarHidden = false // Asegurarse de mostrar el NavigationBar si se vuelve atrás sin tocar la imagen
                        }
                        
                    }
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    .matchedGeometryEffect(id: "Container\(selectedPost.id)", in: namespace)
                    .transition(.hero) // Aplicar la transición personalizada
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(2)
                    .overlay(Divider(), alignment: .bottom)
                    .overlay(FooterView(), alignment: .bottom)
                    .navigationBarHidden(true)
                }
            }
            
        }
        
    }
    var sidebarButton: some View {
        Button(action: {
            // Acción para abrir el Sidebar
        }) {
            Image(systemName: "sidebar.left")
        }
    }
    
    var settingsButton: some View {
        Button(action: {
            // Acción del botón de configuración
        }) {
            Image(systemName: "gearshape")
        }
    }
}

struct FooterView: View {
    var body: some View {
        HStack {
            // Texto a la izquierda
            Text("Air Sanchez")
                .fontWeight(.heavy)
                .bold()
            
            // Flecha a la derecha
            Spacer()
            Image(systemName: "arrow.up")
                .foregroundColor(.green)
                .onTapGesture {
                    // Acción para subir al inicio de la pantalla
                    // Aquí puedes implementar tu lógica para hacer scroll hacia arriba
                }
        }
    }
}
struct ContentView: View {
    var body: some View {
        PostListView()
    }
}
struct PostListView_Previews: PreviewProvider{
    static var previews: some View{
        PostListView()
    }
}
