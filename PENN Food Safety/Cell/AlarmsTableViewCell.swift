//
//  AlarmsTableViewCell.swift
//  Demo2
//
//  Created by Jitendra Agarwal on 14/10/22.
//

import UIKit

class AlarmsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var imgNotification: UIImageView!
    @IBOutlet weak var cabinetNameLabel: UILabel!
    @IBOutlet weak var notificationTextLabel: UILabel!
    @IBOutlet weak var daysAgoLabel: UILabel!
    @IBOutlet weak var reasonTextLabel: UILabel!
    @IBOutlet weak var remarksLabel: UILabel!
    
    @IBOutlet weak var actionTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBG.layer.cornerRadius = 8.0
        
    }
    var alarmViewModel: AlarmViewModel! {
        didSet {
            self.cabinetNameLabel.text =  alarmViewModel.cabinetNameDescription
            self.notificationTextLabel.text =  alarmViewModel.notificationTextDescription
            self.daysAgoLabel.text = alarmViewModel.timeAgo
            self.reasonTextLabel.text =  alarmViewModel.reasonDescription
            self.remarksLabel.text = alarmViewModel.remarksDescription
            imgNotification.image =  alarmViewModel.notificationImage
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
