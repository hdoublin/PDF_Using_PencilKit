//
//  CustomAlertViewController.swift
//  PDFPencilKit
//
//  Created by mymac on 2020/12/25.
//

import UIKit
import SkyFloatingLabelTextField

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var alertViewContainer: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var NameTxt: SkyFloatingLabelTextField!
    @IBOutlet weak var addDateSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIs()
        
    }
    
    func setupUIs() {
 
        NameTxt.delegate = self
        alertViewContainer.layer.cornerRadius = 20
        alertViewContainer.layer.borderColor = UIColor.black.cgColor
        alertViewContainer.layer.borderWidth = 2
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addDateSwitchSelected(_ sender: Any) {
        if !addDateSwitch.isOn
        {
            //add date to fileName
            print("FileName Added")
        }
        else
        {
            print("FileName not added")
        }
    }
    
}

extension CustomAlertViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        // Execute additional code
//        let vc
        return true
    }

}
