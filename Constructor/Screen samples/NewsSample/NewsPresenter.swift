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
        
        closure([.init(title: "У нас новая печь!", time: "20 мая", description: "Приглашаем всех попробовать пиццу из нашей печии"),
                 .init(title: "Поздравляем вас с праздником Великой Победы!", time: "9 мая", description: "В честь праздника дарим десерт"),
                 .init(title: "Открываем новую точку", time: "17 апреля", description: "Ждём вас на открытии нового ресторана возле метро Проспект Победы"),
                 .init(image: UIImage(systemName: "birthday.cake"), title: "День рождения", time: "10 апреля", description: "Приглашаем вас на наш день рождения!!!")])
    }
}

class NewsPresenter: NewsOutput {
    
    var sample = Samples.newsSample
    
    weak var newsViewController: NewsInput?
    
    private let newsService: INewsService
    
    init(newsService: INewsService) {
        self.newsService = newsService
    }
    
    func viewWillAppear() {
        newsService.getNews(closure: { newsViewController?.show(newsModels: $0)} )
    }
    
}
