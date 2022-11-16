//
//  AlarmDetailCell.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 08/11/22.
//

import UIKit
import Foundation


class AlarmDetailCell: BaseTableViewCell {
    
    @IBOutlet weak var staticDismissedLabel: UILabel!
    @IBOutlet weak var staticCorrectiveActionLabel: UILabel!
    @IBOutlet weak var staticReasonLabel: UILabel!
    @IBOutlet weak var staticMsgLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var alarmDetailBBGView: UIView!
    @IBOutlet weak var dismissedOnLabel: UILabel!
    @IBOutlet weak var correctiveActionLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var raisedOnLabel: UILabel!
    @IBOutlet weak var cabinetNameLabel: UILabel!
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        alarmDetailBBGView.layer.cornerRadius = 8.0
    }
    
    func configure(model: AlarmViewModel!) {
        
        cabinetNameLabel.text = model?.cabinetNameDescription
        messageLabel.text = model?.notificationTextDescription
        
        if let dismissedOnTxt = model.dismmisedOn {
            if format.dateFormat == "yyyy-MM-dd'T'HH:mm:ssZ" {
                let dismissedOnDate = self.convertUTCDateToLocalDate(dateToConvert: dismissedOnTxt)
                dismissedOnLabel.text = dismissedOnDate
            }else if format.dateFormat == "yyyy-MM-dd'T'HH:mm:ss.SSSZ" {
                let dismissedOnDate = self.convertUTCDateToLocalDate2(dateToConvert: dismissedOnTxt)
                dismissedOnLabel.text = dismissedOnDate
            }
        }else {
            staticDismissedLabel.isHidden = true
            dismissedOnLabel.isHidden = true
        }
        
        if let txt2 =  model.actionDescription {
            correctiveActionLabel.text = model?.actionDescription
            
        }else {
            staticCorrectiveActionLabel.isHidden = true
            correctiveActionLabel.isHidden = true
            
        }
        
        if let txt3 = model.reasonDescription {
            reasonLabel.text = model?.reasonDescription
        } else {
            staticReasonLabel.isHidden = true
            reasonLabel.isHidden = true
            
        }
        
        if let dt = model.raisedOn {
            let date = self.convertUTCDateToLocalDate(dateToConvert: dt)
            raisedOnLabel.text = date
        }
        
        if model.isDismissed == false {
            staticDismissedLabel.isHidden = true
            dismissedOnLabel.isHidden = true
        }
    }
    
    private func convertUTCDateToLocalDate(dateToConvert:String) -> String {
        
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let convertedDate = format.date(from: dateToConvert)
        format.timeZone = TimeZone.current
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let localDateStr = format.string(from: convertedDate!)
        return localDateStr
        
    }
    
    private func convertUTCDateToLocalDate2(dateToConvert:String) -> String {
        
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let convertedDate = format.date(from: dateToConvert)
        format.timeZone = TimeZone.current
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let localDateStr = format.string(from: convertedDate!)
        return localDateStr
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}



