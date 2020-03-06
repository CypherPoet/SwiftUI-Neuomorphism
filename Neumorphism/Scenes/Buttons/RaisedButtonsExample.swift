//
//  RaisedButtonsExample.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/3/20.
// ✌️
//

import SwiftUI


struct RaisedButtonsExample {
}


// MARK: - View
extension RaisedButtonsExample: View {

    var body: some View {
        VStack(spacing: 0) {
            lightExample
            darkExample
        }
        .edgesIgnoringSafeArea(.all)
    }
}


// MARK: - Computeds
extension RaisedButtonsExample {
}


// MARK: - View Variables
extension RaisedButtonsExample {
    
    private var lightExample: some View {
        ZStack {
            Color("OffWhite")
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    
                    Text("Button")
                        .fontWeight(.medium)
                }
            }
            .buttonStyle(
                RaisedButtonStyle(
                    shape: Circle(),
                    minWidth: 100,
                    minHeight: 100,
                    fillColor: Color("LightBackgroundStart"),
                    pressedFillColor: Color("LightBackgroundStart-Lighter"),
                    highlightColor: Color("Highlight1"),
                    shadowColor: Color("MidtoneShadow"),
                    foregroundColor: .purple
                )
            )
            .colorScheme(.light)
        }
    }
    
    
    private var darkExample: some View {
        ZStack {
            LinearGradient(Color("DarkBackgroundStart"), Color("DarkBackgroundEnd"))
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    
                    Text("Button")
                        .fontWeight(.medium)
                }
            }
            .buttonStyle(
                RaisedButtonStyle(
                    shape: Circle(),
                    minWidth: 100,
                    minHeight: 100,
                    fillColor: Color("DarkBackgroundEnd"),
                    pressedFillColor: Color("DarkBackgroundEnd-Lighter"),
                    highlightColor: Color("Shadow1"),
                    shadowColor: Color("DarkBackgroundEnd"),
                    foregroundColor: .purple
                )
            )
            .colorScheme(.dark)
        }
    }
}


// MARK: - Private Helpers
private extension RaisedButtonsExample {
}





// MARK: - Preview
struct NeumorphicButtonExample_Previews: PreviewProvider {

    static var previews: some View {
        RaisedButtonsExample()
    }
}
