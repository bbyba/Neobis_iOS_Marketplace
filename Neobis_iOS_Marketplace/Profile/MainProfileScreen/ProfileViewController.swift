//
//  ProfileViewController.swift
//  Neobis_iOS_Marketplace
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileView = ProfileView()
    lazy var editProfilerVC = PersonalInfoViewController()
    lazy var favoritesVC = FavoritesViewController()
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = profileView.titleLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileView.changeButton)
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
        addTargets()
    }
    
    func addTargets(){
        profileView.changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }

    @objc func changeButtonTapped() {
        print("changeButtonTapped")
        navigationController?.pushViewController(editProfilerVC, animated: true)
    }
}
 
    

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                navigationController?.pushViewController(favoritesVC, animated: true)
//            case 1:
//                navigationController?.pushViewController(myProductsVC, animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                handleLogout()
            default:
                break
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func handleLogout() {
        print("User logged out")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileView.profileCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileView.profileCategories[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVCell", for: indexPath) as? ProfileTVCell else {
            fatalError("Unable to dequeue ProfileTVCell")}
        cell.configure(with: profileView.profileCategories[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 16 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        footerView.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 249/255, alpha: 1)
      
        return footerView
    }
}
