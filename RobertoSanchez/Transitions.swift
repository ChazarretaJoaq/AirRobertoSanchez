//
//  Transitions.swift
//  RobertoSanchez
//
//  Created by gustavo joaquin chazarreta on 30/06/2023.
//

import SwiftUI

extension AnyTransition{
    
    static let hero = AnyTransition.modifier(
        active: HeroModifier(porcentage:1),
        identity: HeroModifier(porcentage: 0)
    )
    struct HeroModifier : AnimatableModifier{
        var porcentage :Double
        
        var animatableData: Double{
            get {
                porcentage
            }
            set {
                porcentage = newValue
            }
        }
        
        func body(content: Content) -> some View {
            content
                .opacity(1)
        }
    }
}
