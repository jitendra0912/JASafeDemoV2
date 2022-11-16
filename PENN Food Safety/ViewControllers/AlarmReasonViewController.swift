//
//  AlarmReasonViewController.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import UIKit
import Foundation


class AlarmReasonViewController: BaseViewController {
    
    @IBOutlet weak var searchBackgroundView: JASearchBar!
    var alrmModel: AlarmViewModel?
    var alarmReasonViewModel = [AlarmReasonViewModel]()
    var filteredData = [Any]()
    var isSearching = false
    var correctiveActionViewModel = [CorrectiveActionViewModel]()
    
    @IBOutlet weak var alarmReasonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBackgroundView.delegate =  self
        self.alarmReasonTableView.separatorStyle = .none
        alarmReasonTableView.delegate = self
        alarmReasonTableView.dataSource = self
        searchBackgroundView.layer.cornerRadius = 16
        callAlarmReasonAPI()
        callCorrectiveActionAPI()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Reasons")
        self.updateMenuButton(type: .back)
    }
    
}

extension AlarmReasonViewController {
    
    func callAlarmReasonAPI() {
        LoadingView.show()
        let request = ResolveReasonAPI()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)) { (model, err) in
            if let error = err {
                print(error)
                LoadingView.hide()
            } else {
                if let alarmData = model?.data {
                    self.alarmReasonViewModel = (alarmData.map({AlarmReasonViewModel(resolvedReasonModel: $0)}))
                    DispatchQueue.main.async {
                        LoadingView.hide()
                        self.alarmReasonTableView.reloadData()
                    }
                }
            }
        }
    }
}

extension AlarmReasonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        } else {
            return alarmReasonViewModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResolveReasonTableViewCell", for: indexPath) as! ResolveReasonTableViewCell
        
        if isSearching {
            cell.alarmReasonViewModel = filteredData[indexPath.row] as? AlarmReasonViewModel
        } else {
            cell.alarmReasonViewModel = alarmReasonViewModel[indexPath.row]
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let correctiveActionVC = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: CorrectiveActionViewController.self)) as! CorrectiveActionViewController
        let reasonIDAlarm = alarmReasonViewModel[indexPath.row].reasonIDDescription
        
        correctiveActionVC._alarmReasonViewModel = alarmReasonViewModel[indexPath.row]
        correctiveActionVC._alrmModel = self.alrmModel
       
        
        let filteredData = correctiveActionViewModel.filter({$0.reasonIDDescription == reasonIDAlarm})
        correctiveActionVC.actionFilterData = filteredData
        NavigationHelper.helper.contentNavController!.pushViewController(correctiveActionVC, animated: true)
        
        
        
    }
    
}


extension AlarmReasonViewController : JASearchBarDelegate {
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = alarmReasonViewModel.filter({($0.reasonTextDescription?.lowercased().prefix(searchText.count))! == searchText.lowercased()})
                isSearching = true
        alarmReasonTableView.reloadData()
   
        
    }
}


extension AlarmReasonViewController {

    func callCorrectiveActionAPI() {
        LoadingView.show()
        let request = CorrectiveActionAPI()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)) { (model, err) in
            if let error = err {
                print(error)
                LoadingView.hide()
            } else {
                if let alarmData = model?.data {
                    self.correctiveActionViewModel = (alarmData.map({CorrectiveActionViewModel(correctiveActionModel: $0)}))
                    DispatchQueue.main.async {
                        LoadingView.hide()
                        self.alarmReasonTableView.reloadData()
                    }
                }
            }
        }
    }
}
