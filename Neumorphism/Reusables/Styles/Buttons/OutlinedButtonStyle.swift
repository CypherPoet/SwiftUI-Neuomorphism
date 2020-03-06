//
//  OutlinedButtonStyle.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/4/20.
// ✌️
//

import Foundation
import SwiftUI


public struct OutlinedButtonStyle: ButtonStyle {
    public var minWidth: CGFloat?
    public var minHeight: CGFloat?
    public var foregroundColor: Color
    public var borderColor: Color
    public var borderWidth: CGFloat
    public var cornerRadius: CGFloat

    
    public init(
        minWidth: CGFloat? = 44,
        minHeight: CGFloat? = 44,
        foregroundColor: Color = .primary,
        borderColor: Color = .accentColor,
        borderWidth: CGFloat = 3.0,
        cornerRadius: CGFloat = 8.0
    ) {
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }
}


// MARK: - makeBody
extension OutlinedButtonStyle {
    
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .frame(minWidth: minWidth, minHeight: minHeight)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .foregroundColor(foregroundColor)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}
