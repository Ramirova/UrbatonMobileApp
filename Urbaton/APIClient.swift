//
//  APIClient.swift
//  Urbaton
//
//  Created by Розалия Амирова on 18/05/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

class APIClient {
    
    func loadArticles(pageSize: Int, pageOffset: Int) -> [Possibility] {
        let url = URL(string: Constants.baseURL + Constants.getArticles)!
        
        
        let params = ["pageSize" : String(pageSize), "pageOffset": String(pageOffset)]
        let urlComp = NSURLComponents(string: Constants.baseURL + Constants.getArticles)!
        var items = [URLQueryItem]()
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        items = items.filter{!$0.name.isEmpty}
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        var urlRequest = URLRequest(url: urlComp.url!)
        
        
        
        
//        urlRequest.setValue(String(pageSize), forHTTPHeaderField: "pageSize")
//        urlRequest.setValue(String(pageOffset), forHTTPHeaderField: "pageOffset")
//        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
//            let string1 = String(data: data!, encoding: String.Encoding.utf8)
//            print("Loaded")
//
//            //            let jsonData = Data(String(data: data!, encoding: String.Encoding.utf8)!)
//
//            guard let data = data else { return }
//
//            guard let serverResponse = try? JSONDecoder().decode(ServerResponseData.self, from: data) else {
//                completion(nil, "Ошибка парсинга docflow ServerResponseData")
//                return
//            }
//            completion(serverResponse, nil)
//        }
//        task.resume()
        return [Possibility]()
    }
}
