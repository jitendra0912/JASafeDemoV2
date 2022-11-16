//
//  AlarmDetailViewController.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 08/11/22.
//

import UIKit
import Foundation


class AlarmDetailViewController: BaseViewController {
    
    @IBOutlet weak var alarmDetailTableView: UITableView!
    var alrmModel: AlarmViewModel?
    var _alrmDataM: DataM?

    @IBOutlet weak var resolveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmDetailTableView.dataSource = self
        alarmDetailTableView.delegate = self
        
        if self.alrmModel?.isDismissed  == false{
            resolveButton.isHidden = false

        }else {
            resolveButton.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Notification Detail")
        self.updateMenuButton(type: .back)
        
    }
    @IBAction func resolveButtonPressed(_ sender: Any) {
        
        let alarmReasonVC = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: AlarmReasonViewController.self)) as! AlarmReasonViewController
        alarmReasonVC.alrmModel  =  self.alrmModel
        alarmReasonVC.callAlarmReasonAPI()
        NavigationHelper.helper.contentNavController!.pushViewController(alarmReasonVC, animated: true)
        
    }
    
}

extension AlarmDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmDetailCell", for: indexPath) as! AlarmDetailCell
        cell.configure(model: self.alrmModel)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    
}
