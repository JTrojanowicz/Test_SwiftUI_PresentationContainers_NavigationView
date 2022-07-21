//
//  SeventhView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import SwiftUI

struct SeventhView: View {
    @EnvironmentObject var user: User
    @State private var isBackButtonHidden = false
    var body: some View {
        
        //NOTICE: We do not write NavigationView again in the nested view!!!!
        
        VStack {
            Text("Score: \(user.score)")
            
            Button("Increase") {
                user.score += 1
            }
            
            Button("Toggle BackButton Hidden") {
                isBackButtonHidden.toggle()
            }
            .padding()
            
            Button("Go back using environment object property") {
                user.isShowingDetails = false
            }
            
            NavigationLink(destination: NestedNavigationView()) {
                Text("Go to NESTED navigation view")
            }
            .padding()
        }
        .navigationTitle("User Details") // NOTICE: You can put .navigationTitle anywhere in this view because the important thing is that it is inside NavigationView
        .navigationBarBackButtonHidden(isBackButtonHidden) // NOTICE: You can hide navigation BackButton (it could be useful when you want the user to actively make a choice before moving backwards) // NOTICE: You can put .navigationBarBackButtonHidden anywhere in this view because the important thing is that it is inside NavigationView
    }
}

struct SeventhView_preview: PreviewProvider {
    static var previews: some View {
        Group {
            SeventhView()
                .previewLayout(PreviewLayout.sizeThatFits)
//                .previewInterfaceOrientation(.landscapeLeft)
                .padding()
                .previewDisplayName("Default preview")
                .environment(\.horizontalSizeClass, .compact)
                .environment(\.verticalSizeClass, .regular)
                .environmentObject(User())
            
            SeventhView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
                .environmentObject(User())
        }
    }
}
