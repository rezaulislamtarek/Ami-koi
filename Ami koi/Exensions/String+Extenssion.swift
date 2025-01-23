//
//  String+Extenssion.swift
//  Ami koi
//
//  Created by Rezaul Islam on 23/1/25.
//

import Foundation
extension String {
    func replacingNewlineWithComma() -> String {
        self.replacingOccurrences(of: "\n", with: ", ")
    }
}
