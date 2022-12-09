//
//  DetailListBackgroundViewModel.swift
//  FindCVS
//
//  Created by 이준혁 on 2022/12/09.
//

import RxSwift
import RxCocoa

struct DetailListBackgroundViewModel {
    
    // ViewModel -> View
    // 데이터가 없으면 보여주고, 데이터가 있으면 숨긴다.
    let isStatusLabelHidden: Signal<Bool>
    
    // 외부에서 전달받을 값
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)  // 에러가 나면 숨긴다.
    }
}
