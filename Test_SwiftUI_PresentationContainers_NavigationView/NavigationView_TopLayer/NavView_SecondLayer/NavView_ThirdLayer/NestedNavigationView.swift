//
//  SeventhNestedView.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import SwiftUI

struct NestedNavigationView: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            Button("Go backwards 2 views in hierarchy") {
                user.isShowingDetails = false
            }
        }
    }
}
