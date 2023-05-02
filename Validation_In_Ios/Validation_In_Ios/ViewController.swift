//
//  ViewController.swift
//  Validation_In_Ios
//
//  Created by PHN MAC 1 on 02/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK TextFields
    @IBOutlet weak var nameTxt: CustomUITextField!
    @IBOutlet weak var mobileTxt: CustomUITextField!
    @IBOutlet weak var emailTxt: CustomUITextField!
    
    //Warning Label
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        textFieldConfiger()
    }
    
    func textFieldConfiger(){
        nameTxt.delegate = self
        mobileTxt.delegate = self
        emailTxt.delegate = self
    }
    func setLabel(){
        nameLbl.text = ""
        mobileLbl.text = ""
        emailLbl.text = ""
    }
    
    func checkValidate() -> Bool{
        //Check Validation
        let mobileValidation =  Validation.mobileNumber(value: mobileTxt.text, label: mobileLbl)
        let emailValidation = Validation.email(value: emailTxt.text, label: emailLbl)
        let nameValidation = Validation.name(value: nameTxt.text, label: nameLbl)
       
        let validate : Bool =  mobileValidation && emailValidation && nameValidation
        return validate
    }
    
    @IBAction func submitBtnClick(_ sender: UIButton) {
        print(checkValidate())
    }
    
}

extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if nameTxt == textField {
            return Validation.nameRistricte(value: string)
        }

        else if mobileTxt == textField{
            if textField.text?.count == 10{
                return false
            }
        }
        return true
    }
  
}
