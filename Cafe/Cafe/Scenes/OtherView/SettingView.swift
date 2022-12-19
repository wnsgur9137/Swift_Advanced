//
//  SwiftUIView.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/20.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section {
                SettingUserInfoSettingView()
            }
            
            Button("회원 정보 수정") {
                
            }
            .accentColor(.black)
            
            Button("회원 탈퇴") {
                
            }
            .accentColor(.black)
        }
        .navigationTitle("Setting")
        .listStyle(GroupedListStyle())
    }
}

struct SettingUserInfoSettingView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.username)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("LogOut")
                    .accentColor(.green)
                    .font(.system(size: 14.0, weight: .bold, design: .default))
            }
            .padding(8.0)
            .overlay(Capsule().stroke(Color.green))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
