//
//  ViewController.swift
//  PDFPencilKit
//
//  Created by mymac on 2020/12/4.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var plusBtnInSide: UIButton!
    @IBOutlet weak var addBtnInSide: UILabel!
    @IBOutlet weak var sideContainerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var plusBtnInContent: UIButton!
    @IBOutlet weak var addBtnInContent: UILabel!
    
    @IBOutlet weak var NewContainerView: UIView!
    @IBOutlet weak var newNoteBtn: UIButton!
    @IBOutlet weak var importPdfBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIs()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.reloadData()
    }
    
    func setupUIs() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "sideCell", bundle: nil), forCellReuseIdentifier: "sideCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        let cellSize = CGSize(width: 250, height: 350)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        sideContainerView.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
        NewContainerView.layer.borderColor = UIColor.black.cgColor
        NewContainerView.layer.cornerRadius = 30
        NewContainerView.layer.borderWidth = 2
        newNoteBtn.layer.cornerRadius = 10
        importPdfBtn.layer.cornerRadius = 10
       
        NewContainerView.isHidden = true
        
        plusBtnInSide.addTarget(self, action: #selector(addBtnInSidePressed), for: .touchUpInside)
        
        plusBtnInContent.addTarget(self, action: #selector(addBtnInContentPressed), for: .touchUpInside)
        let tapAddBtnInSide = UITapGestureRecognizer(target: self, action: #selector(addBtnInSidePressed))
        addBtnInSide.isUserInteractionEnabled = true
        addBtnInSide.addGestureRecognizer(tapAddBtnInSide)
        let tapAddBtnInContent = UITapGestureRecognizer(target: self, action: #selector(addBtnInContentPressed))
        addBtnInContent.isUserInteractionEnabled = true
        addBtnInContent.addGestureRecognizer(tapAddBtnInContent)
        
        
    }
    
    
    @IBAction func settingBtnPressed(_ sender: Any) {
        print("settingButton pressed")
    }
    
    @objc func addBtnInSidePressed() {
        print("add button in sidemenu pressed")
    }
    
    @objc func addBtnInContentPressed() {
        print("add button in content view pressed")
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
            self.NewContainerView.isHidden = false
        })
    }
    
    @IBAction func newNoteBtnPressed(_ sender: Any) {
        print("new note button pressed")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CustomAlertViewController")
        present(vc, animated: true, completion: nil)
//        performSegue(withIdentifier: "toNewNoteViewController", sender: nil)
    }
    
    @IBAction func importPdfBtnPressed(_ sender: Any) {
        print("import button pressed")
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
            self.NewContainerView.isHidden = true
        })
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell", for: indexPath) as! sideCell
        cell.cellImage.image = #imageLiteral(resourceName: "opened")
        cell.cellTitle.text = "Math_test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("I am tapping at: \(indexPath.row)")
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! contentCell
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderWidth = 5
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentImage.image = #imageLiteral(resourceName: "contentImage") // File Snapshot
        cell.contentImage.contentMode = .scaleToFill
        cell.contentLbl.text = "2020-09-10 Lecture 1" //FileName
        
        return cell
    }
    
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("collection_view_selected: \(indexPath.row)")
        performSegue(withIdentifier: "toPDFViewController", sender: nil)
    }

}

