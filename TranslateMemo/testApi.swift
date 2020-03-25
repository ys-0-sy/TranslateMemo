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
    testApi(rawString: "")
  }
  
  func testApi(rawString:String)  {
    if let keyString = Bundle.main.object(forInfoDictionaryKey: "GoogleAPIKey") as? String, let googleAPIKey = KeyManager().getValue(key: keyString) as? String {
        AF.request("https://translation.googleapis.com/language/translate/v2",
                   method: .post,
                   parameters: [
                    "q": rawString,
                    "target": "ja",
                    "key": googleAPIKey]).responseData {response in
                      if let value = response.value {
                        let json = JSON(value)
                        print(json)
                        if let translatedText = json["data"]["translations"][0]["translatedText"].string {
                          debugPrint(translatedText)
                          self.responseString = translatedText
                        } else {
                          self.responseString = "json parse error"
                      }
                        
                      } else {
                        self.responseString = "request Error"
                      }
      }
    } else {
      print("Environment error")
    }

    
  }
}
