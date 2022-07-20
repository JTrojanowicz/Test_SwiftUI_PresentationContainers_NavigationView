//
//  EighthView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import SwiftUI

struct EighthView: View {
    @Binding var isShowing: Bool
    @State private var isBackButtonHidden = true
    var body: some View {
        VStack {
            Button("Toggle BackButton") {
                isBackButtonHidden.toggle()
            }
            .padding()
            
            Button("Go backward programmatically") {
                isShowing = false
            }
        }
        .navigationBarHidden(isBackButtonHidden)
    }
}
