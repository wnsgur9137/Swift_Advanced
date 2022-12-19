//
//  CenterNetwork.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import Foundation
import Combine

class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // Observable과 같다 (Single)
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Infuser \(APIKeys.dataKey)", forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500: // Client Error
                    throw URLError(.clientCertificateRejected)
                case 500..<599: // Server Error
                    throw URLError(.badServerResponse)
                default: // others Error
                    throw URLError(.unknown)
                }
            }// Publish로 리턴할 때 디코더를 사용
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map{ $0.data }
            .mapError{ $0 as! URLError } // Error일 경우
            .eraseToAnyPublisher() // Error 반환
    }
}
