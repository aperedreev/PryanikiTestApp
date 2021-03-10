//
//  Sample.swift
//  PryanikiTestApp
//
//  Created by A L E X on 3/4/21.
//

import Foundation

struct SampleResponse: Decodable {
    let data: [Sample]
    let view: [String]
}

struct Sample: Decodable {
    let name: String
    let data: Data
    

}

struct Data: Decodable {
    var text:       String?
    var url:        String?
    var selectedId: Int?
    var variants:   [Variant]?
}

struct Variant: Decodable {
    var id:   Int
    var text: String
}
