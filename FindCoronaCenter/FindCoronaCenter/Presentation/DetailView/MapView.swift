//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    // 좌표
    var coordination: CLLocationCoordinate2D
    
    // MapView의 상태를 나타내주는 프로퍼티
    // @State는 이 View 내에서만 변화하는 상태이다.
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(
            coordinateRegion: $region, // State는 $표시 를 통해 계속 주시하겠다는 의미
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate, // 맵의 가운데 좌표를 무엇으로 둘 것인가.
            span: MKCoordinateSpan(  // 얼만큼 가깝고 크게 나타낼 것이냐.
                // 0에 가까울수록 커지고, 1에 가까울 수록 넓은 범위의 맵을 보여준다.
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
                )
        )
    }
    
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let centers0 = Center(
            id: 0,
            sido: .경기도,
            facilityName: "실내방상장 앞",
            address: "경기도 안양시 동안구 평촌대로 389",
            lat: "37.404476",
            lng: "126.9491998",
            centerType: .local,
            phoneNumber: "031-8045-4843"
        )
        MapView(coordination: CLLocationCoordinate2D(
            latitude: CLLocationDegrees(centers0.lat) ?? .zero,
            longitude: CLLocationDegrees(centers0.lng) ?? .zero
            )
        )
    }
}
