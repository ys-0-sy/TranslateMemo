//
//  ContentView.swift
//  TranslateMemo
//
//  Created by saito on 2020/03/22.
//  Copyright © 2020 saito. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var Api = testApi()
    var body: some View {
      VStack {
        Text("hoge")
        Text("\(self.Api.responseString)")
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
