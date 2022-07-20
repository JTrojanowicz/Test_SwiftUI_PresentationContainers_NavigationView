//
//  SheetView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import SwiftUI

struct SheetView: View {
    @available(iOS 15, *) @Environment(\.dismiss) var dismiss
    @available(iOS 14, *) @Environment(\.presentationMode) var presentationMode
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            Button("Press to dismiss using @Environment") {
                if #available(iOS 15, *) {
                    dismiss()
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            
            Button("Press to dismiss using @Binding") {
                isShowing = false
            }
        }
    }
}
