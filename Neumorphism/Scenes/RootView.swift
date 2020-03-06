//
//  RootView.swift
//  Neumorphism
//
//  Created by CypherPoet on 3/3/20.
// ✌️
//

import SwiftUI


struct RootView {

}


// MARK: - View
extension RootView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CardExample()) {
                    Text("Card")
                }
                
                NavigationLink(destination: RaisedButtonsExample()) {
                    Text("Raised Buttons")
                }
                
                NavigationLink(destination: BumpedButtonsExample()) {
                    Text("Bumped Buttons")
                }
            }
            .navigationBarTitle("Neumorphism")
        }
    }
}


// MARK: - Computeds
extension RootView {
}


// MARK: - View Variables
extension RootView {
}


// MARK: - Private Helpers
private extension RootView {
}



// MARK: - Preview
struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        RootView()
    }
}
