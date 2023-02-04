//
//  UIViewExtensions.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/30/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
