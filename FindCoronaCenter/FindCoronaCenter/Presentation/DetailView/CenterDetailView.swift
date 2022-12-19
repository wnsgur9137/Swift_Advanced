//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import SwiftUI

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)   // Navigation과 같은 SafeArea 무시
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 화면에 꽉 차게
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(
            id: 0,
            sido: .경기도,
            facilityName: "실내방상장 앞",
            address: "경기도 안양시 동안구 평촌대로 389",
            lat: "37.404476",
            lng: "126.9491998",
            centerType: .local,
            phoneNumber: "031-8045-4843"
        )
        CenterDetailView(center: center0)
    }
}
