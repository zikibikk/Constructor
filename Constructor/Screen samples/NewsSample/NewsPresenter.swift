//
//  NewsPresenter.swift
//  Constructor
//
//  Created by Alina Bikkinina on 17.05.2023.
//

import UIKit

protocol INewsService {
    func getNews(closure: ([NewsModel])->())
}

class NewsService: INewsService {
    func getNews(closure: ([NewsModel])->()) {
        closure([])
    }
}

class NewsPresenter: NewsOutput {
    
    weak var newsViewController: NewsInput?
    
    private let newsService: INewsService
    
    init(newsService: INewsService) {
        self.newsService = newsService
    }
    
    func viewWillAppear() {
        newsService.getNews(closure: { newsViewController?.show(newsModels: $0)} )
    }
    
}
