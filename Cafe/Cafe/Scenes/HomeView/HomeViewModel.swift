//
//  HomeViewModel.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/20.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isNeedToReload = false {
        willSet {   // willSet -> 새로운 값이 들어오기 직전
            
        }
        didSet {    // didSet -> 값이 변경되었을 경우
            guard isNeedToReload else { return }
            coffeeMenu.shuffle()
            events.shuffle()
            isNeedToReload = false
        }
    }
    
    @Published var coffeeMenu: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "드립커피"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 드립커피"),
    ]
    
    @Published var events: [Event] = [
        Event(image: Image("coffee"), title: "제주도 한정 메뉴", description: "제주도 한정 음료가 출시되었습니다! 꼭 드셔보세요!"),
        Event(image: Image("coffee"), title: "여름 한정 메뉴", description: "여름이니까 아이스커피 ~"),
    ]
}
