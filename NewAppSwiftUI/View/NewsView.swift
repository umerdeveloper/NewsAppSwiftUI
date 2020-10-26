//
//  ContentView.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import SwiftUI

struct NewsView: View {
    
    var news: [Hits]
    
    var body: some View {
        
        NavigationView {

            List(news, id: \.self) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(post.title ?? "Unknown Error")

                        }
                    })
            }
            .navigationTitle(Text("News"))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}
