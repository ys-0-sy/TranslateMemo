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
    AF.request("https://en.wikipedia.org/w/api.php",
                 method: .get,
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
  }
}
