//
//  LandingViewModel.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 12/11/20.
//

import Foundation

class LandingViewModel {
    var newsModel: MostPopularNewsModel = MostPopularNewsModel()
    
    func getTitle(for index: Int) -> String {
        return newsModel.results?[index].title ?? ""
    }
    
    func getAuthor(for index: Int) -> String {
        return newsModel.results?[index].byLine ?? ""
    }
    
    func getDate(for index: Int) -> String {
        return newsModel.results?[index].publishedDate ?? ""
    }
}
