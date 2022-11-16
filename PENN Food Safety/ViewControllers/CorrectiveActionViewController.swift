//
//  CorrectiveActionViewController.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 11/11/22.
//

import UIKit
import Foundation


class CorrectiveActionViewController: BaseViewController {

    @IBOutlet weak var correctiveActionSearchView: JASearchBar!
    @IBOutlet weak var correctiveActionTableView: UITableView!
    
    var _alarmReasonViewModel: AlarmReasonViewModel?
    
    var _alrmModel: AlarmViewModel?

    var correctiveActionViewModel = [CorrectiveActionViewModel]()
    var actionFilterData: [CorrectiveActionViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        correctiveActionTableView.delegate = self
        correctiveActionTableView.dataSource = self
        correctiveActionSearchView.layer.cornerRadius = 16
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Corrective Action")
        self.updateMenuButton(type: .back)
        
    }
    
    
}


extension CorrectiveActionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionFilterData!.count
//        if isSearching {
//            return filteredData.count
//        } else {
//            return alarmReasonViewModel.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectiveActionTableViewCell", for: indexPath) as! CorrectiveActionTableViewCell
        
        cell.correctiveActionViewModel = actionFilterData![indexPath.row]
        
       
        
        
        
//        if isSearching {
//            cell.alarmReasonViewModel = filteredData[indexPath.row] as? AlarmReasonViewModel
//        } else {
//            cell.alarmReasonViewModel = alarmReasonViewModel[indexPath.row]
//        }
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let remarkViewController = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: RemarkViewController.self)) as! RemarkViewController
        remarkViewController.correctActionTitle = self.actionFilterData?[indexPath.row].actionTextDescription
            remarkViewController.reasonTitle = _alarmReasonViewModel?.reasonTextDescription
          //  remarkViewController._alrmModel = self._alrmModel
        NavigationHelper.helper.contentNavController!.pushViewController(remarkViewController, animated: true)
        
        
        
        
        
        
        
//        let request = AlarmAPI()
//        let apiLoader = APILoader(apiHandler: request)
//        
//        
//        apiLoader.postNotificationAPI(model: ) { response in
//            <#code#>
//        } failure: { error in
//            <#code#>
//        }

    }
}

