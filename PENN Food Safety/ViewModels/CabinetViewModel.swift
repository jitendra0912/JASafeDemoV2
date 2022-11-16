//
//  CabinetViewModel.swift
//  PENNFoodSafety
//
//  Created by Jitendra.Agarwal2 on 16/10/22.
//

import Foundation
import UIKit
class CabinetViewModel {
    var childSensorDescription: String?
    var resultSensorDescription: String?
    var sensorTemperatureValue: String?
    var cabinetDescription: String?
    var notificationImage: UIImage?
    var notifiactionCount:Int?
    var notificationisHide:Bool?
    var separateViewColor:UIColor?
    var sensorTemperatureLabelColor:UIColor?
    var cellAlarmColor:UIColor?
    // Dependency Injection (DI)
    init(cabinetsModel: Result) {
        cellAlarmColor =  .white
        self.childSensorDescription =  cabinetsModel.child?.sensors?[0].sensorDescription
        self.resultSensorDescription =  cabinetsModel.sensors?[0].sensorDescription
        separateViewColor = .lightGray
        sensorTemperatureValue = "No Data"
        sensorTemperatureLabelColor = .gray
        if let tempValue = cabinetsModel.sensors?[0].maxTemp, let degreeCelcius = cabinetsModel.sensors?[0].unitOfMeasurement?.umAbbreviated {
            sensorTemperatureValue = "\(String(describing: tempValue)) \(String(describing: degreeCelcius))"
            separateViewColor = .clear
            sensorTemperatureLabelColor = UIColor(red: 0.549, green: 0.776, blue: 0.243, alpha: 1)
        }
        cabinetDescription =  cabinetsModel.resultDescription
        let count = Int(cabinetsModel.unclearedAlarms ?? 0)
        if count > 0 {
            cellAlarmColor =  UIColor(red: 0.792, green: 0.137, blue: 0.224, alpha: 1)
            notificationisHide =  false
            separateViewColor =  .red
            notificationImage = UIImage(named: "bell.png")
            notifiactionCount =  count
        }else{
            notificationisHide =  true
        }
    }

}
