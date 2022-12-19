//
//  Sample2.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/20.
//

import SwiftUI

class ButtonModel: ObservableObject {
    @Published var isDisabled = true
}

struct OtherMainView: View {
    @ObservedObject var buttonModel = ButtonModel()
    
    var body: some View {
        VStack {
            Sample2(isDisabled: $buttonModel.isDisabled)
        }
    }
}

struct ParentView: View {
    
    @ObservedObject var buttonModel = ButtonModel()
    
    var body: some View {
        VStack {
            Sample2(isDisabled: $buttonModel.isDisabled)
            OtherMainView()
        }
    }
}

struct Sample2: View {
    
//    @State private var currentText = ""
//    @State private var isDisabled = true
    @Binding var isDisabled: Bool
    
    var body: some View {
//        VStack {
//            TextField("텍스트를 입력해주세요.", text: $currentText)
//            Text(currentText)
//        }
        
        VStack {
            Toggle(isOn: $isDisabled, label: {
                Text("버튼을 비활성화 시키겠습니까?")
            })
            
            Button("버튼") {}
                .disabled(isDisabled)
        }
    }
}

struct Sample2_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
