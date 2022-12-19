//
//  Tab.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/18.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    // associate Value
    // 바로 반환할 수 있는 변수
    var textItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
