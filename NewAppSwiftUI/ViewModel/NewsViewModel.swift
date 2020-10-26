//
//  NewsViewModel.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import Foundation
class NewsViewModel: ObservableObject {
    
    @Published var news = [Hits]()
    @Published var loadingState = LoadingState.loading
    private var networkingService = NetworkingService()
    
    private var hits: Hits?
    
    init(hits: Hits? = nil) {
        self.hits = hits
    }
    
    var url: String {
        hits?.url ?? ""
    }
    
    var title: String {
        hits?.title ?? ""
    }
    
    func getNews() {
        
        self.loadingState = .loading
        
        networkingService.getNews { result in
            
            switch result {
            case .success(let hits):
                
                DispatchQueue.main.async {
                    self.news = hits
                    self.loadingState = .success
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}
