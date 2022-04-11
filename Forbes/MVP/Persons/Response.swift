//
//  Response.swift
//  Forbes
//
//  Created by Мурад on 02.03.2022.
//

import Foundation

struct Response: Decodable {
    let error: Int
    let data: [Person]
}

// MARK: - Datum
struct Person: Decodable {
    let fio, sex, post, company: String
    let photo: String
}

