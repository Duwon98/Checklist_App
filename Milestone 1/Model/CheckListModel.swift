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
    /// Checklist title
    @Published var title: String
    /// Checklist's list (it is array)
    @Published var lists = [String]()

    init(title: String) {
        self.title = title
    }
    
    /// <#Description#>
    /// In order to create the Keys for Json
    enum CodingKeys: String, CodingKey, RawRepresentable{
        case title
        case lists
    }
    
    /// <#Description#>
    /// Manually decoding the values (because Class has been used)
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        lists = try container.decode([String].self, forKey: .lists)
    }
 
    /// <#Description#>
    /// Manually encoding the values (because Class has been used)
    func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(lists, forKey: .lists)
    }
}


