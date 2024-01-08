//
//  MyProductsViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class MyProductsViewController: UIViewController {

    lazy var myProductsView = MyProductsView()
    
    override func loadView() {
        self.view = myProductsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: myProductsView.backButton)
        navigationItem.titleView = myProductsView.tabBarTitleLabel
    
        addTargets()
    }
    
    func addTargets(){
        myProductsView.backButton.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
    }
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }

}
