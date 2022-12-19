//
//  SelectRegionView.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import SwiftUI

struct SelectRegionView: View {
    // 바라보는 쪽
    // func bind(viewModel = SelectRegionViewModel())
    @ObservedObject var viewModel = SelectRegionViewModel()
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 20) {
                    // allCases -> Sido의 모든 케이스를 Array로 가져온다.
                    ForEach(Center.Sido.allCases, id: \.id) { sido in
                        let centers = viewModel.centers[sido] ?? []
                        NavigationLink(destination: CenterList(centers: centers)) {
                            // SelectRegionItem을 탭하면 전달한다.
                            SelectRegionItem(region: sido, count: centers.count)
                        }
                    }
                }
                .padding()
                .navigationTitle("코로나19 예방접종 센터")
            }
        }
    }
}

struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
