//
//  StringExtension.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/30/22.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
