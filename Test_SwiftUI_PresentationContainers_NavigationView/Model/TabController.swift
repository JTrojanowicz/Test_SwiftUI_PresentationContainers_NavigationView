//
//  TabController.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import Foundation

enum Tab {
    case navView1, modalsPopoversOthers, splitView
}

class TabController: ObservableObject {
    @Published var activeTab = Tab.navView1
    
    func open(_ tab: Tab) {
        activeTab = tab
    }
}
