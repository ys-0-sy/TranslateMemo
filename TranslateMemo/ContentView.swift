//
//  ContentView.swift
//  TranslateMemo
//
//  Created by saito on 2020/03/22.
//  Copyright © 2020 saito. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON




struct ContentView: View {
  @State var text:String = "Initializing..."
    var body: some View {
      Text("\(text)")
      .onReceive(testApi(), perform: {response in
        if let rawJson = response.value {
          let json = JSON(rawJson)
          if let logintoken = json["query"]["tokens"]["logintoken"].string {
            return logintoken
            debugPrint(logintoken)
          } else {
            print("json parse error")
          }
        }})
  }
  func testApi() -> DataRequest {
      let response = AF.request("https://en.wikipedia.org/w/api.php",
                 method: .get,
                 parameters: [
                  "action": "query",
                  "format": "json",
                  "meta": "tokens",
                  "type": "login"]).responseData
      return response
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
