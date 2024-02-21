//
//  Mems.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import Foundation

// MARK: - Mems
struct Mems: Decodable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Decodable {
    let id, name: String
    let url: String
    let width, height, boxCount, captions: Int
}
