//
//  LocalNetworkStub.swift
//  FindCVSTests
//
//  Created by 이준혁 on 2022/12/10.
//

import Foundation
import RxSwift
import RxCocoa
import Stubber //JSON 등을 네트워크처럼 전달해주는 라이브러리

@testable import FindCVS

class LocalNetworkStub: LocalNetwork {
    override func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return Stubber.invoke(getLocation, args: mapPoint)
    }
}
