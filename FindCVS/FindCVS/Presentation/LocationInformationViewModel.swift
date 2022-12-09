//
//  LocationInformationViewModel.swift
//  FindCVS
//
//  Created by 이준혁 on 2022/12/09.
//

import RxSwift
import RxCocoa

struct LocationInformationViewModel {
    let disposeBag = DisposeBag()
    
    // ViewModel -> View
    let setMapCenter: Signal<MTMapPoint> // 센터를 잡으라
    let errorMessage: Signal<String> // 에러 메세지
    
    // View -> ViewModel
    let currentLocation = PublishRelay<MTMapPoint>() // 편의점
    let mapCenterPoint = PublishRelay<MTMapPoint>() // 중앙점
    let selectPOIItem = PublishRelay<MTMapPOIItem>() // 아이템 선택
    let mapViewError = PublishRelay<String>() // 에러 메세지
    let currentLocationButtonTapped = PublishRelay<Void>() // 버튼 클릭
    
    init() {
        //MARK: 지도 중심점 설정
        let moveToCurrentLocation = currentLocationButtonTapped
            .withLatestFrom(currentLocation) // currentLocation을 한 번이라도 받은 이후에
        
        let currentMapCenter = Observable
            .merge(
                currentLocation.take(1),
                moveToCurrentLocation
            )
        
        setMapCenter = currentMapCenter
            .asSignal(onErrorSignalWith: .empty())
        
        errorMessage = mapViewError.asObservable()
            .asSignal(onErrorJustReturn: "잠시 후 다시 시도해주세요.")
    }
}
