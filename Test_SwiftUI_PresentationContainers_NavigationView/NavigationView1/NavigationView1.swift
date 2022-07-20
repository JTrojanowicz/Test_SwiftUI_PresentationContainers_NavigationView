//
//  NavigationView1.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import SwiftUI

struct NavigationView1: View {
    
    @State private var isShowingFourthView = false
    @State private var navigationSelection: NavigationTag?
    @StateObject private var user = User()
    @State private var fullScreen = false
    @State private var isShowingEighthView = false
    
    enum NavigationTag {
        case nav1, nav2
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    // NOTICE: You can have more than one NavigationLink inside NavigationView
                    NavigationLink(destination: Text("SecondView")) {
                        // NOTICE: The content is implicitly in HStack
                        Text("Go to the second view")
                        
                        Image(systemName: "gear") //NOTICE: automatically tinted in blue
                        
                        Image(systemName: "gear")
                            .renderingMode(.original) // NOTICE: to remove the automatic tint
                    }
                    .padding()
                    
                    // NOTICE: You can swap the parameters of the NavigationLink --> now the navigation text is the first parameter (but it can only be a String) and the destination is a second parameter (more control over the destination)
                    NavigationLink("Go to third view") {
                        Text("Third view")
                            .navigationTitle("NavTitle of 3rd view")
                    }
                    .padding()
                    
                    // NOTICE: You can go to detail view programatically and you can come back programatically (see: onAppear method)
                    NavigationLink(destination: Text("Fourth view - programmatic navigation"), isActive: $isShowingFourthView) {
                        EmptyView() // NOTICE: This EmptyView could be practical!
                    }
                }

                VStack {
                    Button("Tap to go to the fourth view programatically") {
                        isShowingFourthView = true
                    }
                    .padding()
                    
                    // NOTICE: You can navigate programatically using tags:
                    Button("Tap to show fifth view") {
                        navigationSelection = .nav1
                    }
                    NavigationLink(destination: Text("Fifth view"), tag: NavigationTag.nav1, selection: $navigationSelection) {
                        EmptyView() // invisible NavigationLink
                    }
                    
                    Button("Tap to show sixth view") {
                        navigationSelection = .nav2
                    }
                    NavigationLink(destination: Text("Sixth view"), tag: NavigationTag.nav2, selection: $navigationSelection) { }
                        .hidden() // invisible NavigationLink
                }
                
                VStack {
                    // NOTICE: NavigationView automatically shares its environment with any child view but .environmentObject modifier needs to be outside NavigationView
                    HStack {
                        Text("Score: \(user.score)")
                        NavigationLink(destination: SeventhView(), isActive: $user.isShowingDetails) {
                            Text("Go to 7th view")
                        }
                        //                    .environmentObject(user) // WRONG! .environmentObject modifier needs to be outside NavigationView
                    }
                    .padding()
                    
                    NavigationLink(destination: EighthView(isShowing: $isShowingEighthView), isActive: $isShowingEighthView) {
                        Text("Go to 8th view")
                    }
                    
                    // NOTICE: You can remove navigation bar
                    Button("Toggle Full Screen") {
                        fullScreen.toggle()
                    }
                    .navigationBarHidden(fullScreen)
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // NOTICE: You can put NavigationLink also in the toolbar
                    NavigationLink("9th view") {
                        Text("The nineth view")
                            .navigationTitle("9th view")
                    }
                }
            }
            .navigationTitle("Main Nav. View") // NOTICE: you need to use .navigationViewStyle modifier unless you want to have rubbish in the debug console
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack) // NOTICE: This modifier removes all the debug console rubbish that happen when you use .navigationTitle modifier (probably it is a bug)
        .environmentObject(user) // NOTICE: NavigationView automatically shares its environment with any child view but .environmentObject modifier needs to be outside NavigationView
        .statusBar(hidden: fullScreen)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.isShowingFourthView = false // navigate back to the main view
            }
        }
    }
}


