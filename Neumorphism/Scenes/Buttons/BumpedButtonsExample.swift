//
//  BumpedButtonsExample.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


struct BumpedButtonsExample {
}


// MARK: - View
extension BumpedButtonsExample: View {

    var body: some View {
        VStack(spacing: 0) {
            lightExample
            darkExample
        }
        .edgesIgnoringSafeArea(.all)
    }
}


// MARK: - Computeds
extension BumpedButtonsExample {
}


// MARK: - View Variables
extension BumpedButtonsExample {
    
    private var lightExample: some View {
        ZStack {
            LinearGradient(Color("LightBackgroundStart"), Color("LightBackgroundEnd"))
            
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
                BumpedButtonStyle(
                    shape: Circle(),
                    minWidth: 100,
                    minHeight: 100,
                    paddingRatio: 1.0,
                    fillColor: Color("LightBackgroundStart"),
                    highlightColor: Color("Highlight1"),
                    shadowColor: Color("Highlight2"),
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
                // TODO: Perhaps create a BumpedButtonStyling protocol, and then a
                // BumpedCircleButton that handled some of these arguments as defaults
                BumpedButtonStyle(
                    shape: Circle(),
                    minWidth: 100,
                    minHeight: 100,
                    paddingRatio: 1.0,
                    fillColor: Color("DarkBackgroundEnd"),
                    highlightColor: Color("Shadow1"),
                    shadowColor: Color("Shadow2"),
                    foregroundColor: .purple
                )
            )
            .colorScheme(.dark)
        }
    }
}


// MARK: - Private Helpers
private extension BumpedButtonsExample {
}





// MARK: - Preview
struct BumpedButtonExample_Previews: PreviewProvider {

    static var previews: some View {
        BumpedButtonsExample()
    }
}
