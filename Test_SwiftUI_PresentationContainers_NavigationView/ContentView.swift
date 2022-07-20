//
//  ContentView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

// LINKS:
// https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
// https://www.swiftbysundell.com/articles/swiftui-programmatic-navigation/

import SwiftUI

struct ContentView: View {
    
    @StateObject private var tabController = TabController()
    
    var body: some View {
        TabView(selection: $tabController.activeTab) {
            NavigationView1()
                .tag(Tab.navView1) // NOTICE: Tags help in navigatating throughout TabView
                .tabItem { Label("NavView1", systemImage: "1.square")}
                .badge("Info") // NOTICE: iOS15 introduced badge
            
            ModalsPopoversOthers()
                .tag(Tab.modalsPopoversOthers)
                .tabItem { Label("Modals", systemImage: "2.square")}
                .badge(2) // NOTICE: iOS15 introduced badge
            
            SplitView()
                .tag(Tab.splitView)
                .tabItem { Label("Split", systemImage: "3.square")}
        }
        .environmentObject(tabController) // NOTICE: .environmentObject modifier must be on the TabView and not inside it
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("Default preview")
//                .previewInterfaceOrientation(.landscapeLeft) // can still be useful because enabling this modifier allow us to make clicks etc (whereas "Orientation variants allow us only to view the screen)
//                .previewLayout(PreviewLayout.sizeThatFits) // sometimes it may be better to see only a single view, not the entire device
            
            ContentView()
                .previewDisplayName("iPad preview")
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)")) // list of devices --> run in Terminal: xcrun simctl list devicetypes
        }
    }
}

