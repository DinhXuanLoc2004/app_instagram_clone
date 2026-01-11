//
//  HashUtil.swift
//  Runner
//
//  Created by User on 9/1/26.
//

import CryptoKit
class HashUtil {
    static func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap {
            String(format: "%02x", $0)
        }.joined()
    }

}
