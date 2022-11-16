//
//  CabinetCardTableViewCell.swift
//  Demo2
//
//  Created by Varun Shukla on 27/09/22.
//

import UIKit

class CabinetCardTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lineView: UIView!
   // @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var buttonNotification: UIButton!
    @IBOutlet weak var labelCloseOpenStatus: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelSenserDesc: UILabel!
    @IBOutlet weak var labelAirTemp: UILabel!
    @IBOutlet weak var labelDoor: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 8.0
        lineView.layer.cornerRadius = 8.0
   
    }
    var cabinetViewModel: CabinetViewModel! {
        didSet {
            self.cardView.backgroundColor =  cabinetViewModel.cellAlarmColor
            self.labelAirTemp.text =  cabinetViewModel.resultSensorDescription
            self.labelDoor.text =  cabinetViewModel.childSensorDescription
            self.labelSenserDesc.text = cabinetViewModel.cabinetDescription
            self.labelTemperature.text =  cabinetViewModel.sensorTemperatureValue
            self.labelTemperature.textColor = cabinetViewModel.sensorTemperatureLabelColor
            buttonNotification.isHidden = cabinetViewModel.notificationisHide ?? false
            buttonNotification.setImage(cabinetViewModel.notificationImage, for: .normal)
            buttonNotification.setTitle(String(describing:cabinetViewModel.notifiactionCount), for: .normal)
            let nofiCount =  cabinetViewModel.notifiactionCount ?? Int(0)
            buttonNotification.setTitle(String(describing:nofiCount) , for: .normal)
            lineView.backgroundColor = cabinetViewModel.separateViewColor
           
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
