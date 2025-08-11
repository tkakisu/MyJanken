//
//  ContentView.swift
//  MyJanken
//
//  Created by takahiro kakisu on 2025/08/11.
//

import SwiftUI

struct ContentView: View {
    // じゃんけんの結果を格納する変数（0=初期画面、1=グー、2=チョキ、3=パー）
    @State var jankenNumber = 0
    
    var body: some View {
        VStack {
            if jankenNumber == 0 {
                Text("これからじゃんけんをします！")
            } else if jankenNumber == 1 {
                // グー画像を指定
                Image(.gu)
                // リサイズを指定
                    .resizable()
                // 画面に収まるように、アスペクト比（縦横比）を維持する指定
                    .scaledToFit()
                // じゃんけんの種類を指定
                Text("グー")
            } else if jankenNumber == 2 {
                // チョキ画像を指定
                Image(.choki)
                    .resizable()
                    .scaledToFit()
                Text("チョキ")
            } else {
                // パー画像を指定
                Image(.pa)
                    .resizable()
                    .scaledToFit()
                Text("パー")
            }
            
            Button(action: {
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newJankenNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                repeat {
                    newJankenNumber = Int.random(in: 1...3)
                    
                } while jankenNumber == newJankenNumber
                
                // 新しいじゃんけんの結果を格納
                jankenNumber = newJankenNumber
            }, label: {
                Text("じゃんけんをする")
            })
        }
    }
}

#Preview {
    ContentView()
}
