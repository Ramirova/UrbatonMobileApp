//
//  PossibilityStructure.swift
//  Urbaton
//
//  Created by Розалия Амирова on 18/05/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation


struct Possibility: Codable {
    var id: String
    var title: String
    var info: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case info
    }
}
