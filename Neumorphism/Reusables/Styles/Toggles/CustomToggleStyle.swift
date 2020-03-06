//
//  CustomToggleStyle.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


public struct CircleToggleStyle {
    public var fabWidth: CGFloat
    public var trackWidth: CGFloat
    public var fabFillColor: Color
    public var highlightColor: Color
    public var shadowColor: Color
    public var glowColor: Color
    public var fabBorderColor: Color
    public var fabBorderColorWhenOn: Color
    public var trackFillColor: Color
    public var trackFillColorWhenOn: Color
    
    
    public init(
        fabWidth: CGFloat = 40,
        trackWidth: CGFloat? = nil,
        fabFillColor: Color,
        highlightColor: Color = Color("Highlight1"),
        shadowColor: Color = Color("Shadow1"),
        glowColor: Color = Color("Glow1"),
        fabBorderColor: Color = Color("Border2"),
        fabBorderColorWhenOn: Color = Color("Border1"),
        trackFillColor: Color = Color.secondary.opacity(0.7),
        trackFillColorWhenOn: Color = .secondary
    ) {
        self.fabWidth = fabWidth
        self.trackWidth = trackWidth ?? fabWidth * 1.5
        self.fabFillColor = fabFillColor
        self.highlightColor = highlightColor
        self.shadowColor = shadowColor
        self.glowColor = glowColor
        self.fabBorderColor = fabBorderColor
        self.fabBorderColorWhenOn = fabBorderColorWhenOn
        self.trackFillColor = trackFillColor
        self.trackFillColorWhenOn = trackFillColorWhenOn
    }
}


extension CircleToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        
            HStack {
                configuration.label

                // Ensure that the toggle and the label lay out end-to-end in iOS Forms
                #if os(iOS)
                Spacer()
                #endif
                
                ZStack {
                    // Track
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(configuration.isOn ? trackFillColorWhenOn : trackFillColor)
                        .animation(.none)
                        .frame(width: trackWidth, height: trackHeight)
                        .sfumato(
                            isHighlighted: configuration.isOn,
                            highlightColor: configuration.isOn ? glowColor : shadowColor,
                            shadowColor: shadowColor,
                            shadowRadius: trackHeight / 7,
                            animationForHighlighting: fabAnimation
                        )
                    
                    // Fab
                    Circle()
                        .fill(
                            configuration.isOn ?
                                LinearGradient(shadowColor, fabFillColor)
                                : LinearGradient(fabFillColor, highlightColor)
                        )
                        .sfumato(
                            isHighlighted: configuration.isOn,
                            highlightColor: highlightColor,
                            shadowColor: shadowColor,
                            shadowRadius: fabWidth / 8
                        )
                        .overlay(
                            pressedBorderOverlay
                                .opacity(configuration.isOn ? 1.0 : 0.0)
                                .animation(fabAnimation)
                        )
                        .overlay(borderOverlay)
                        .frame(width: fabWidth, height: fabWidth)
                        .offset(x: (fabWidth / 2) * CGFloat(configuration.isOn ? 1 : -1))
                        .animation(fabAnimation)
                        .onTapGesture {
                            withAnimation(self.fabAnimation) {
                                configuration.isOn.toggle()
                            }
                        }
                }
            }
            .accessibility(
                activationPoint: configuration.isOn ?
                    AccessibilityActivationPoint.on
                    : AccessibilityActivationPoint.off
            )
            
            // Place the guide in the horizontal position between the label and the switch
            .alignmentGuide(.leading) { dimensions in
                dimensions.width - self.trackWidth
            }
    }
}


extension CircleToggleStyle {
    private enum AccessibilityActivationPoint {
        static let on = UnitPoint(x: 0.25, y: 0.5)
        static let off = UnitPoint(x: 0.75, y: 0.5)
    }
}


// MARK: - Computeds
extension CircleToggleStyle {
    var verticalSpacing: CGFloat { 2.0 }
    var trackHeight: CGFloat { trackWidth / 2 }
    var cornerRadius: CGFloat { .infinity }
    
    var fabAnimation: Animation {
        .easeOut(duration: 0.212)
    }
}



// MARK: - View Variables
private extension CircleToggleStyle {
    
    var borderOverlay: some View {
        Circle().stroke(
            fabBorderColor,
            lineWidth: fabWidth * 0.04
        )
    }
    
    
    var pressedBorderOverlay: some View {
        Circle().stroke(
            LinearGradient(highlightColor, fabBorderColorWhenOn),
            lineWidth: fabWidth * 0.025
        )
    }
}



//
//// MARK: - Preview
//struct CircleToggleStyle_Previews: PreviewProvider {
//
//    struct PreviewView: View {
//        @State private var isOn = false
//
//        var body: some View {
//            Toggle(isOn: $isOn) {
//                Text(isOn ? "On" : "Off")
//            }
////            .toggleStyle(
////                CircleToggleStyle()
////            )
//        }
//    }
//
//
//    static var previews: some View {
//        PreviewView()
//    }
//}
    
    


