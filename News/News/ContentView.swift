//
//  ContentView.swift
//  News
//
//  Created by Nurken Kidirmaganbetov  on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    typealias Article = NewsModel.Article
    
    @ObservedObject var newsModel: NewsModel
    
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea() // background changer
            
            VStack {
                if newsModel.allNews {
                    // TODO: - all news view
                    Text("All news")
                        .foregroundColor(Color("tabColor"))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top)
                }
                else {
                    Text("Top Headlines")
                        .foregroundColor(Color("tabColor"))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top)
                    
                    TopArticlesListView(articles: newsModel.articles)
                        .task {
                            await newsModel.updateTopNews()
                        }
                        .padding(10)
                }
                Spacer()
                
                TabView(areAllNews: newsModel.allNews, onClick: newsModel.chooseNews)
            }
            
        }
            .foregroundColor(.accentColor)

    }
}

#Preview {
    ContentView(newsModel: NewsModel()) // allowable
}
