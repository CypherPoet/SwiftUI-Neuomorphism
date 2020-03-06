//
//  View+Sfumato.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


extension View {

    public func sfumato(
        isHighlighted: Bool,
        highlightColor: Color,
        shadowColor: Color,
        shadowRadius: CGFloat = 10.0
    ) -> some View {
        modifier(
            SfumatoViewModifier(
                isHighlighted: isHighlighted,
                highlightColor: highlightColor,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius
            )
        )
    }

}
