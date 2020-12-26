//
//  NewNoteViewController.swift
//  PDFPencilKit
//
//  Created by mymac on 2020/12/26.
//

import UIKit

class NewNoteViewController: UIViewController {

    var pencilKitCanvas =  PKCanvas()
    @IBOutlet weak var pencilBoardView: PKCanvas!
    @IBOutlet weak var homeBtn: UIButton!
    
    override func viewDidLoad() {
        
    }
    
    //MARK: - iOS Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        addPencilKit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCanvasOrientation(with: view.bounds)
        view.bringSubviewToFront(homeBtn)
    }
    
    //MARK: - iOS override properties
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    //MARK: -  Setup Functions

    private func addPencilKit() {
        view.backgroundColor = .clear

        pencilKitCanvas  = createPencilKitCanvas(frame: view.frame, delegate: self)
        view.addSubview(pencilKitCanvas)
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "PDFPencilKit", message: "Do you wish to continue to ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (element) in
            //... save action
            



            self.navigationController?.popToRootViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default) { (element) in
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
}

extension NewNoteViewController: PencilKitInterface { }

extension NewNoteViewController: PencilKitDelegate { }
