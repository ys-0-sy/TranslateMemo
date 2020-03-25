//
//  KeyManager.swift
//  TranslateMemo
//
//  Created by saito on 2020/03/24.
//  Copyright © 2020 saito. All rights reserved.
//

import Foundation

struct KeyManager {
    private let keyFilePath = Bundle.main.path(forResource: "keys", ofType: "plist")
    
    func getKeys() -> Dictionary<String, AnyObject>? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath) as? Dictionary<String, AnyObject>
    }
    
    func getValue(key: String) -> AnyObject? {
        guard let keys = getKeys() else {
            return nil
        }
        return keys[key]
    }
}
