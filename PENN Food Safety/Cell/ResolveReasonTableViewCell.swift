//
//  ResolveReasonTableViewCell.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 10/11/22.
//

import UIKit

class ResolveReasonTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var resolveReasonBGView: UIView!
    
    @IBOutlet weak var resolveReasonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }
    
    var alarmReasonViewModel: AlarmReasonViewModel! {
        didSet {
            
            self.resolveReasonLabel.text = alarmReasonViewModel.reasonTextDescription
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
