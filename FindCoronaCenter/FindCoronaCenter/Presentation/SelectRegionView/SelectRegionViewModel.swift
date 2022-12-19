//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import Foundation
import Combine

// ObservableObject -> 외부에서 바라볼 수 있는 오브젝트이다.
// 나중에 View랑 연결될 때 사용
class SelectRegionViewModel: ObservableObject {
    // @Published -> 어떤 객체를 내보낼 것이냐.
    @Published var centers = [Center.Sido: [Center]]() // Cido: [Center] 딕셔너리
    
    // Rx의 DisposeBag()에 해당한다.
    private var cancellable = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)    // receive를 이용하여 Main Thread에 뿌려준다.
            .sink( // Subscribe에 해당한다.
                receiveCompletion: { [weak self] in // 실패한 값을 받았다면
                    guard case .failure(let error) = $0 else { return } // 만약 실패라면
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]() // 빈 딕셔너리를 그대로 둔다.
                },
                receiveValue: { [weak self] centers in // 정상적으로 값을 받았다면
                    self?.centers = Dictionary(grouping: centers) { $0.sido } // sido를 key로 그룹핑한다.
                }
            )
            .store(in: &cancellable) // disposed(by: disposeBag)
    }
}
