//
//  AlarmViewModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 15/10/22.
//

import Foundation
import UIKit

class AlarmViewModel {
    
    var notificationTextDescription: String?
    var cabinetNameDescription: String?
    var reasonDescription: String?
    var actionDescription: String?
    var remarksDescription: String?
    var raisedOn: String?
    var timeAgo: String?
    var isDismissed: Bool?
    var notificationImage:UIImage?
    var dismmisedOn: String?

    // Dependency Injection (DI)
    init(alarmModel: DataM) {
        self.notificationTextDescription = alarmModel.notificationText
        self.cabinetNameDescription = alarmModel.cabinetName
        self.reasonDescription = alarmModel.reasonText
        self.actionDescription = alarmModel.actionText
        self.remarksDescription = alarmModel.remarks
        self.raisedOn = alarmModel.raisedOn
        self.isDismissed = alarmModel.isDismissed
        self.dismmisedOn = alarmModel.dismmisedOn
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self.raisedOn ?? "")
        
        if let pastDate = date {
            timeAgo = pastDate.timeAgoDisplay()
            print("daysAgo:\(String(describing: timeAgo))")
        }
        if (alarmModel.notificationType == EnotificationType.Alarm.rawValue) && alarmModel.isDismissed == true  {
                    notificationImage = UIImage(named: "bellGreen")   //"bellGreen"
                }
                else if (alarmModel.notificationType == EnotificationType.Alarm.rawValue) && alarmModel.isDismissed == false  {
                   notificationImage = UIImage(named: "bell")
                }
        

    }
    func checkLabelisEmpty(aLabel:UILabel)->Bool? {
        if let text = aLabel.text, !text.isEmpty {
          return true
        }else  {
            return false
        }
    }
}
