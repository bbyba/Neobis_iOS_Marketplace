//
//  PersonalInfoViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    lazy var personalInfoView = PersonalInfoView()
    
    override func loadView() {
        self.view = personalInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: personalInfoView.cancelButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: personalInfoView.doneButton)
    
        addTargets()
    }
    
    func addTargets(){
        personalInfoView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        personalInfoView.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        personalInfoView.pickProfilePicButton.addTarget(self, action: #selector(pickPhotoTapped), for: .touchUpInside)
    }
    
    @objc func pickPhotoTapped(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func cancelButtonTapped(){
        
    }
    
    @objc func doneButtonTapped(){
        
    }
}

extension PersonalInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            personalInfoView.userImage.image = image
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
