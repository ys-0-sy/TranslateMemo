//
//  testApi.swift
//  TranslateMemo
//
//  Created by saito on 2020/03/24.
//  Copyright © 2020 saito. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class testApi: ObservableObject {
  @Published var responseString: String = "Initializing..."
  init(){
    testApi()
  }
  
  func testApi()  {
    var apiKey = env["GOOGLE_API_KEY"] as? String {
        AF.request("https://translation.googleapis.com/language/translate/v2",
                     method: .post,
                     parameters: [
                      "action": "query",
                      "format": "json",
                      "meta": "tokens",
                      "type": "login"]).responseData {response in
                        if let value = response.value {
                          let json = JSON(value)
                          if let logintoken = json["query"]["tokens"]["logintoken"].string {
                            debugPrint(logintoken)
                            self.responseString = logintoken
                          } else {
                            self.responseString = "json parse error"
                        }
                          
                        } else {
                          self.responseString = "request Error"
                        }
        }
    } else do {
        print("Environment Value error")
    }
    
  }
}
