//
//  SfumatoViewModifier.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


struct SfumatoViewModifier {
    var isHighlighted: Bool
    
    var highlightColor: Color
    var shadowColor: Color
    
    var shadowRadius: CGFloat = 10.0
}


// MARK: - Animatable Data
extension SfumatoViewModifier {
}


// MARK: - ViewModifier
extension SfumatoViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .shadow(
                color: highlightColor,
                radius: shadowRadius,
                x: shadowRadius * (isHighlighted ? 0.5 : -1.0),
                y: shadowRadius * (isHighlighted ? 0.5 : -1.0)
            )
            .shadow(
                color: shadowColor,
                radius: shadowRadius,
                x: shadowRadius * (isHighlighted ? -0.5 : 1.0),
                y: shadowRadius * (isHighlighted ? -0.5 : 1.0)
            )
//            .animation(.easeInOut(duration: 0.15))
            .animation(.none)
    }
}


// MARK: - Preview
struct Sfumato_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
