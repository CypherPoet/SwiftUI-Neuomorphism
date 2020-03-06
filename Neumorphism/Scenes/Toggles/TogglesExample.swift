//
//  TogglesExample.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/5/20.
// ✌️
//

import SwiftUI


struct TogglesExample {
    @State private var isAwesome = false
}


// MARK: - View
extension TogglesExample: View {

    var body: some View {
        VStack(spacing: 0) {
            lightExample
            darkExample
        }
        .edgesIgnoringSafeArea(.all)
    }
}


// MARK: - Computeds
extension TogglesExample {
}


// MARK: - View Variables
extension TogglesExample {
    
    private var lightExample: some View {
        ZStack {
            LinearGradient(Color("LightBackgroundStart"), Color("LightBackgroundEnd"))
            
            VStack {
                Toggle(isOn: $isAwesome) {
                    Text("Awesomeness")
                        .font(.headline)
                }
                .toggleStyle(
                    CircleToggleStyle(
                        fabWidth: 44,
                        fabFillColor: Color("LightBackgroundStart"),
                        highlightColor: Color("Highlight1"),
                        shadowColor: Color("Highlight2"),
                        trackFillColor: .gray,
                        trackFillColorWhenOn: .pink
                    )
                )
            }
            .padding(.horizontal)
        }
        .colorScheme(.light)
    }
    
    
    private var darkExample: some View {
        ZStack {
            LinearGradient(Color("DarkBackgroundStart"), Color("DarkBackgroundEnd"))
            
            VStack {
                Toggle(isOn: $isAwesome) {
                    Text("Awesomeness")
                        .font(.headline)
                }
                .toggleStyle(
                    CircleToggleStyle(
                        fabWidth: 44,
                        fabFillColor: Color("DarkBackgroundStart"),
                        highlightColor: Color("Shadow1"),
                        shadowColor: Color("Shadow2"),
                        trackFillColor: .gray,
                        trackFillColorWhenOn: .pink
                    )
                )
            }
            .padding(.horizontal)
        }
        .colorScheme(.dark)
    }
}


// MARK: - Private Helpers
private extension TogglesExample {
}





// MARK: - Preview
struct TogglesExample_Previews: PreviewProvider {

    static var previews: some View {
        TogglesExample()
    }
}
