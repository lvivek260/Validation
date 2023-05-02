//
//  Validation.swift
//  Validation_In_Ios
//
//  Created by PHN MAC 1 on 02/05/23.
//

import Foundation
import UIKit

struct Validation{
    // MARK RISTRICTED_CHARACTERS
    static func nameRistricte(value : String)-> Bool{
        if let char = value.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
              _ = strcmp(char, "\\s")
                if (isBackSpace == -92) {
                    return true
                }
        }
        
        let RISTRICTED_CHARACTERS = "()'*=+[]\\|;:'\",<>/?%$^-_@!#%&`~.1234567890₹"
        let set = CharacterSet(charactersIn: RISTRICTED_CHARACTERS)
            let inverted = set.inverted
            let filtered = value.components(separatedBy: inverted).joined(separator: "")
            return filtered != value
        
    }
    
    
    //Validation return true or false
    static func name(value:String?, label:UILabel)->Bool{
        let name = (value ?? "").trimmingCharacters(in: .whitespaces)
        if name.isEmpty{
            label.text = "name cannot be empty"
            return false
        }
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        if(name.rangeOfCharacter(from: set.inverted) != nil ){
            label.text = "special character, number not valid"
            return false
        }
        label.text = ""
        return true
    }
    
    static func mobileNumber(value : String?, label:UILabel) -> Bool{
        let mobile = (value ?? "").trimmingCharacters(in: .whitespaces)

        if mobile.isEmpty{
            label.text = "Mobile number cannot be empty"
            return false
        }
        else if mobile.count != 10{
            label.text = "Mobile number should be of 10 digit"
            return false
        }
        else{
            let phoneRegex = "^[6-9]\\d{9}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            if phoneTest.evaluate(with: mobile){
                label.text = ""
                return true
            }
            else{
                label.text = "Please enter valid mobile number"
                return false
            }
        }
    }
    
    static func email(value:String?, label:UILabel)->Bool{
        let email = (value ?? "").trimmingCharacters(in: .whitespaces)
        if email.isEmpty{
            label.text = "Email id cannot be empty"
            return false
        }
        else{
            // let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let reqularExpression = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: email){
                label.text = "Email id should be valid"
                return false
            }
            else{
                label.text = ""
                return true
            }
        }
    }
    
    static func password(){
        
    }
}
