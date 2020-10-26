//
//  BaseViewModel.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import Foundation
enum LoadingState {
    
    case loading
    case success
    case failed
    case none
}

class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
