//
//  Event.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/18.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    
    let image: Image
    let title: String
    let description: String
    
    static let sample: [Event] = [
        Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도 한정 음료가 출시되었습니다! 꼭 드셔보세요!"),
        Event(image: Image("coffee"), title: "여름 한정 메뉴", description: "여름이니까 아이스커피 ~"),	
    ]
}
