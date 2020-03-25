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
  @State var rawString:String = ""
    var body: some View {
      VStack {
        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $rawString, onCommit: { self.Api.testApi(rawString: self.rawString)})
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .frame(width: CGFloat(250.0) )
        Text("\(self.Api.responseString)")
      }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
