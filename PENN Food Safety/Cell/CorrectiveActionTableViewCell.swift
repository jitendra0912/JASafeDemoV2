//
//  CorrectiveActionTableViewCell.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 11/11/22.
//

import Foundation
import UIKit


class CorrectiveActionTableViewCell: BaseTableViewCell {
    

    @IBOutlet weak var actionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }
    var correctiveActionViewModel: CorrectiveActionViewModel! {
        didSet {
            
            self.actionLabel.text = correctiveActionViewModel.actionTextDescription

            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
