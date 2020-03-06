//
//  BumpedButtonStyle.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


public struct BumpedButtonStyle<ButtonShape: Shape>: ButtonStyle {
    public var buttonShape: ButtonShape
    public var minWidth: CGFloat
    public var minHeight: CGFloat
    public var paddingRatio: CGFloat
    public var fillColor: Color
    public var highlightColor: Color
    public var shadowColor: Color
    public var borderColor: Color
    public var pressedBorderColor: Color
    public var foregroundColor: Color
    public var foregroundColorWhenPressed: Color
    
    
    public init(
        shape buttonShape: ButtonShape,
        minWidth: CGFloat = 44,
        minHeight: CGFloat = 44,
        paddingRatio: CGFloat = 1.7,
        fillColor: Color = Color("Shadow1"),
        highlightColor: Color = Color("Highlight1"),
        shadowColor: Color = Color("Shadow1"),
        borderColor: Color = Color("Border2"),
        pressedBorderColor: Color = Color("Border1"),
        foregroundColor: Color = .secondary,
        foregroundColorWhenPressed: Color = Color.secondary.opacity(0.7)
    ) {
        self.buttonShape = buttonShape
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.paddingRatio = paddingRatio
        self.fillColor = fillColor
        self.highlightColor = highlightColor
        self.shadowColor = shadowColor
        self.borderColor = borderColor
        self.pressedBorderColor = pressedBorderColor
        self.foregroundColor = foregroundColor
        self.foregroundColorWhenPressed = foregroundColorWhenPressed
    }
}


// MARK: - makeBody
extension BumpedButtonStyle {
    
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .frame(minWidth: minWidth, minHeight: minHeight)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .contentShape(buttonShape)
            .foregroundColor(
                configuration.isPressed ? foregroundColorWhenPressed : foregroundColor
            )
            .animation(.easeInOut(duration: 0.1))
            .background(
                buttonShape
                    .fill(
                        configuration.isPressed ?
                            LinearGradient(shadowColor, fillColor)
                            : LinearGradient(fillColor, highlightColor)
                    )
                    .sfumato(
                        isHighlighted: configuration.isPressed,
                        highlightColor: highlightColor,
                        shadowColor: shadowColor
                    )
            )
            .overlay(
                pressedBorderOverlay
                    .opacity(configuration.isPressed ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.15))
            )
            .overlay(borderOverlay)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0, anchor: .center)
            .animation(.easeOut(duration: 0.05))
    }
}



// MARK: - Computeds
private extension BumpedButtonStyle {
    var horizontalPadding: CGFloat { minWidth / .pi }
    var verticalPadding: CGFloat { horizontalPadding / paddingRatio }
}


// MARK: - View Variables
private extension BumpedButtonStyle {
    
    var borderOverlay: some View {
        buttonShape.stroke(
            borderColor,
            lineWidth: min(minWidth, minHeight) / 22
        )
    }
    
    
    var pressedBorderOverlay: some View {
        buttonShape.stroke(
            LinearGradient(highlightColor, pressedBorderColor),
            lineWidth: min(minWidth, minHeight) / 18
        )
    }
}
