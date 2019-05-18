//
//  PossbilitiesModel.swift
//  Urbaton
//
//  Created by Розалия Амирова on 18/05/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

class PossibilitiesModel {
    
    var apiClient: APIClient = APIClient()
    var possibilities: [Possibility] = [Possibility]()
    var totalPossibilities: Int? = nil
    
    
//    func loadData(pageSize: Int, pageOffset: Int, completion: @escaping (_ articles: [Article]?, _ error: String?) -> Void) {
//        if pageOffset == 0 {
//            articles = [Article]()
//        }
//        if totalNews == nil || totalNews! > pageOffset + pageSize {
//            apiClient.loadArticles(pageSize: pageSize, pageOffset: pageOffset) {
//                responseData, error in
//                guard let responseData = responseData else { return }
//                self.articles.append(contentsOf: responseData.response.news)
//                self.totalPossibilities = responseData.response.total
//                completion(self.articles, error)
//                return
//            }
//        }
//    }
    
//    func loadData() ->__CFByteOrder
    
    func getPossibilities() -> [Possibility] {
        let p1 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p2 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p3 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p4 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p5 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p6 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        let p7 = Possibility.init(id: "1", title: "Сортировать пластик", info: "Информация 1")
        
        possibilities = [p1, p2, p3, p4, p5, p6, p7]
        return possibilities
    }
}
