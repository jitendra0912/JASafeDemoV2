//
//  SideMenuCell.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0, green: 0.3445361853, blue: 0.607401669, alpha: 1)
        self.selectedBackgroundView = myCustomSelectionColorView
        // Background
        self.backgroundColor = .clear
        
        // Icon
        self.iconImageView.tintColor = .white
        
        // Title
        self.titleLabel.textColor = .white
    }
    
    func setupSlideMenu(model:SideMenuModel) {
     
        iconImageView.image =  UIImage(named: model.icon)
        titleLabel.text = model.title
        
    }
}
