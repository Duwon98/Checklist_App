//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation

///  <#Description#>
///  It is a Model Class which has Title and List(Array) properties
class CheckList: Identifiable, ObservableObject, Decodable, Encodable {
    @Published var title: String
    //Checklist title
    @Published var lists = [String]()
    //Checklist's list (it is array)
    init(title: String) {
        self.title = title
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable{
        case title
        case lists
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        lists = try container.decode([String].self, forKey: .lists)
    }
    
    func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(lists, forKey: .lists)
    }
}


