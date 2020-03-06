//
//  FilledButtonStyle.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/4/20.
// ✌️
//

import Foundation
import SwiftUI


public struct FilledButtonStyle: ButtonStyle {
    public var minWidth: CGFloat?
    public var minHeight: CGFloat?
    public var fillColor: Color
    public var foregroundColor: Color
    public var foregroundColorWhenPressed: Color
    public var cornerRadius: CGFloat
    
    
    public init(
        minWidth: CGFloat? = 44,
        minHeight: CGFloat? = 44,
        fillColor: Color = .accentColor,
        foregroundColor: Color = .primary,
        foregroundColorWhenPressed: Color = .gray,
        cornerRadius: CGFloat = 8.0
    ) {
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.fillColor = fillColor
        self.foregroundColor = foregroundColor
        self.foregroundColorWhenPressed = foregroundColorWhenPressed
        self.cornerRadius = cornerRadius
    }
}
 

// MARK: - makeBody
extension FilledButtonStyle {

    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .frame(minWidth: minWidth, minHeight: minHeight)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .foregroundColor(
                configuration.isPressed ? foregroundColorWhenPressed : foregroundColor
            )
            .animation(.easeInOut)
            .background(fillColor)
            .cornerRadius(cornerRadius)
    }
}
