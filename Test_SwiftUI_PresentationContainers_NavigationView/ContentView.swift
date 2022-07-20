//
//  ContentView.swift
//  Test_SwiftUI_PresentationContainers_NavigationView
//
//  Created by Jaroslaw Trojanowicz on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
