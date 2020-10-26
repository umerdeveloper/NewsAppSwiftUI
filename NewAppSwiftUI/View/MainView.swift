//
//  MainView.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var newsVM = NewsViewModel()
    
    var body: some View {
        
        VStack {
            if newsVM.loadingState == .success {
                NewsView(news: newsVM.news)
            } else if newsVM.loadingState == .loading {
                LoadingView()
            }
        }
        .onAppear {
            newsVM.getNews()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
