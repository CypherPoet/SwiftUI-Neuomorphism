//
//  CardExample.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/3/20.
// ✌️
//

import SwiftUI


struct CardExample {
}


// MARK: - View
extension CardExample: View {

    var body: some View {
        ZStack {
            Color("OffWhite")
            
            CardView(backgroundColor: Color("OffWhite"))
                .frame(width: 300, height: 300)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


// MARK: - Computeds
extension CardExample {
}


// MARK: - View Variables
extension CardExample {
    
    struct CardView: View {
        let backgroundColor: Color
        
        
        var body: some View {
            RoundedRectangle(cornerRadius: 12)
                .fill(backgroundColor)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        }
    }
}


// MARK: - Private Helpers
private extension CardExample {
}



// MARK: - Preview
struct NeumorphicCardExample_Previews: PreviewProvider {

    static var previews: some View {
        CardExample()
    }
}
