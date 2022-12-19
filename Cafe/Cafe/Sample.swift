//
//  Sample.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/19.
//

import Foundation

// UINavigationController = UIKit
import UIKit

let navigationController = UINavigationController(rootViewController: SampleViewController())
final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Title"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapRightbarButton))
    }
    
    @objc private func didTapRightbarButton() {
        print("Did tap right bar Button!")
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}


// NavigationView = SwiftUI
import SwiftUI

struct SampleView: View {
    var body: some View {
        Text("Sample")
    }
}

struct SampleNavigationView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Push Button", destination: SampleView())
            }
                .navigationTitle("Title")
                .navigationBarItems(trailing: Button(action: {
                    print("Did tap right bar Button!")
                }, label: {
                    Image(systemName: "gear")
                }))
        }
    }
}

struct SampleNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SampleNavigationView()
    }
}
