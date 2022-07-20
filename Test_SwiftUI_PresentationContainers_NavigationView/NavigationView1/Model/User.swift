//
//  User.swift
//  TestNavigation
//
//  Created by Jaroslaw Trojanowicz on 18/05/2022.
//

import Foundation

class User: ObservableObject {
    @Published var score = 0
    @Published var isShowingDetails = false
}
