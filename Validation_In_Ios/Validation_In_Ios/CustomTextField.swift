//
//  CustomTextField.swift
//  Validation_In_Ios
//
//  Created by PHN MAC 1 on 02/05/23.
//

import Foundation
import UIKit  //Don't forget this

class CustomUITextField: UITextField {
   override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
   }
}
