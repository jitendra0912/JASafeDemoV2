////
////  DetailsViewController.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 21/09/22.
////
//
//import UIKit
//
//class DetailsViewController: BaseViewController {
//    
////    var cabbinetModel = RefrigerationCabinetViewModel()
//    
//    var alarmModel = AlarmViewModel()
//
//
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        self.setNavigationTitle("DetailsVC")
//        alarmModel.getAPIData(siteID: OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)
//        alarmModel.delegate = self
//        self.updateMenuButton(type: .back)
//        
//    }
//    
//}
//
//extension DetailsViewController: AlarmModelDelegte {
//    func didSuccess(response: AlarmModel?, error: ServiceError?) {
//        
//        
//        print("NotificationText: \(String(describing: response?.data[0] .notificationText))")
//        
//        print("CabinetName: \(String(describing: response?.data[0].cabinetName))")
//
//        print("ReasonText: \(String(describing: response?.data[0].reasonText))")
//
//        print("ActionText: \(String(describing: response?.data[0].actionText))")
//        
//        print("Remarks: \(String(describing: response?.data[0].remarks))")
//
//
//        
//        
//    }
//
//}
