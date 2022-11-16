//
//  RefrigerationCollectionViewCell.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 13/09/22.
//

import UIKit

class RefrigerationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var refrigerationImageView: UIImageView!
    @IBOutlet weak var refrigerationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with refrigerationData: Refrigeration) {
        refrigerationImageView.image = refrigerationData.image
        refrigerationLabel.text = refrigerationData.title
    }

}
