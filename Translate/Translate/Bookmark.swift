//
//  Bookmark.swift
//  Translate
//
//  Created by 이준혁 on 2023/01/09.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}
