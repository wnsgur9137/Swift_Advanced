//
//  MainTabView.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/18.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.textItem
                }
            OtherView()
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.textItem
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}





// HStack
// View가 불러와질 때 모두 불러옴
//struct SampleHStack: View {
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack {
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//                Text("HStack 알아보기")
//    //            Text("HStack 알아보기") // 10개 이내만 가능
//            }
//        }
//    }
//}
//
//struct SampleHStack_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleHStack()
//    }
//}



// LazyHStack
// 31개만 불러옴
//struct SampleLazyHStack: View {
//
//    struct Number: Identifiable {
//        let value: Int
//        var id: Int { value }
//    }
//
//    // cellRowAt -> UITableView의 Datasource 메서드를 다음과 같이 사용 가능
//    let numbers: [Number] = (0...100).map { Number(value: $0) } // 0~100까지의 배열
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//        }
//    }
//}
//
//struct SampleLazyHStack_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleLazyHStack()
//    }
//}



// LazyHGrid
// CollectionView와 비슷함
//struct SampleLazyHGrid: View {
//
//    struct Number: Identifiable {
//        let value: Int
//        var id: Int { value }
//    }
//
//    // cellRowAt -> UITableView의 Datasource 메서드를 다음과 같이 사용 가능
//    let numbers: [Number] = (0...100).map { Number(value: $0) } // 0~100까지의 배열
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: [
//                GridItem(.fixed(40)),
//                GridItem(.fixed(30)),
//                GridItem(.fixed(20)),
//                GridItem(.fixed(100)),
//            ]) {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//        }
//    }
//}
//
//struct SampleLazyHGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleLazyHGrid()
//    }
//}



// List
// 보여질 cell만 불러옴 (cell의 추가 및 삭제가 가능)
//struct SampleList: View {
//
//    struct Number: Identifiable {
//        let value: Int
//        var id: Int { value }
//    }
//
//    // cellRowAt -> UITableView의 Datasource 메서드를 다음과 같이 사용 가능
//    let numbers: [Number] = (0...100).map { Number(value: $0) } // 0~100까지의 배열
//
//
//    var body: some View {
//        List { // List는 ScrollView의 기능을 가지고 있다.
//            Section(header: Text("Header1")) {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//
//            Section(header: Text("Header2"), footer: Text("Footer2")) {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//        }
//    }
//}
//
//struct SampleList_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleList()
//    }
//}
