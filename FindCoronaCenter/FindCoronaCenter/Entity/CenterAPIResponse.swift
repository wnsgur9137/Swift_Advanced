//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by 이준혁 on 2022/12/14.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
