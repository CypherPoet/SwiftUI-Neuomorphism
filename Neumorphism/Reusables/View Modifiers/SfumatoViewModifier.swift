//
//  SfumatoViewModifier.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


public struct SfumatoViewModifier {
    public var isHighlighted: Bool
    
    public var highlightColor: Color
    public var shadowColor: Color
    
    public var shadowRadius: CGFloat
    public var animationForHighlighting: Animation?
    
    
    // MARK: - Init
    public init(
        isHighlighted: Bool,
        highlightColor: Color,
        shadowColor: Color,
        shadowRadius: CGFloat = 10.0,
        animationForHighlighting: Animation? = nil
    ) {
        self.isHighlighted = isHighlighted
        self.highlightColor = highlightColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.animationForHighlighting = animationForHighlighting
    }
}


// MARK: - Animatable Data
extension SfumatoViewModifier {
}


// MARK: - ViewModifier
extension SfumatoViewModifier: ViewModifier {

    public func body(content: Content) -> some View {
        content
            .animation(animationForHighlighting ?? .none)
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
    }
}


// MARK: - Preview
struct Sfumato_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
