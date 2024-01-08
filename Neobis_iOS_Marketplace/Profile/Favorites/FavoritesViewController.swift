//
//  FavoritesViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class FavoritesViewController: UIViewController {

    lazy var favoritesView = FavoritesView()
    
    override func loadView() {
        self.view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: favoritesView.backButton)
        navigationItem.titleView = favoritesView.tabBarTitleLabel
    
        addTargets()
    }
    
    func addTargets(){
        favoritesView.backButton.addTarget(self, action: #selector(popToPrevious), for: .touchUpInside)
//        personalInfoView.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
//        personalInfoView.pickProfilePicButton.addTarget(self, action: #selector(pickPhotoTapped), for: .touchUpInside)
    }
    
    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }

}
