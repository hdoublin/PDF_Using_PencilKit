//
//  PDFViewController.swift
//  PDFPencilKit
//
//  Created by mymac on 2020/12/25.
//

import UIKit

class PDFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func homeBtnPressed(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)

    }
    


}
