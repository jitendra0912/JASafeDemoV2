//
//  SideMenuViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import Foundation

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    @IBOutlet var footerLabel: UILabel!
    var viewControllerClass: AnyClass!
    var model: MenuViewModel?
    var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let arrMenu = FSHelper.share.loadSlideMenu(forResource: "FSMenu")
        model  = MenuViewModel(arrMenu: arrMenu as! [AnyObject])
  
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = #colorLiteral(red: 0.002727883635, green: 0.3326534629, blue: 0.5913251638, alpha: 1)
        self.sideMenuTableView.separatorStyle = .none
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        // Footer
        self.footerLabel.textColor = UIColor.white
        self.footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.footerLabel.text = "Johnson Controls"
        
        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
        
        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menu  = model?.slideMenu else {
            return 0
        }
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }
        let obj  = (model?.slideMenu[indexPath.row]) as SideMenuModel?
        cell.setupSlideMenu(model: obj!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        guard let seletedMenuItem =  model?.slideMenu[indexPath.row] else {
            return
        }
        NavigationHelper.helper.openSidePanel(!NavigationHelper.helper.isOpen)
       if let controller =  NSClassFromString(SWIFT_CLASS_STRING(seletedMenuItem.controller) ?? "") {

            if !NavigationHelper.helper.currentViewController!.isKind(of: controller) {
                
                self.navigateToViewController(FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: controller)))
                
            }

        }
    }
}
extension SideMenuViewController {
    
    private func isControllerPresent(controller: AnyClass)->Bool {
        return  NavigationHelper.helper.contentNavController!.hasViewController(ofKind: controller) ?? false
    }
    
    private func navigateToViewController(_ viewController: UIViewController){
        if (viewController.isKind(of: HomeViewController.self)) {
            
            let dashVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as! HomeViewController
            NavigationHelper.helper.contentNavController!.pushViewController(dashVC, animated: true)
        //   NavigationHelper.helper.contentNavController?.popToRootViewController(animated: true)
        }
        else if (viewController.isKind(of: SyncViewController.self)) {
            let sycVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: SyncViewController.self)) as!SyncViewController
            NavigationHelper.helper.contentNavController!.pushViewController(sycVC, animated: true)
        }
        else if (viewController.isKind(of: NotificationViewController.self)) {
            let notVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: NotificationViewController.self)) as! NotificationViewController
            NavigationHelper.helper.contentNavController!.pushViewController(notVC, animated: true)
        }
    }
}

