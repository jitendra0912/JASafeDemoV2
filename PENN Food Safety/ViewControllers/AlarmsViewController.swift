import UIKit
import Foundation

enum EnotificationType: String {
    case None = "None"
    case Alert = "Alert"
    case Alarm =  "Alarm"
}
class AlarmsViewController: BaseViewController {

    @IBOutlet weak var alarmsTableView: UITableView!
    var JASearchBar : JASearchBar?
    var alarmViewModel = [AlarmViewModel]()
    private var arrAlarmData = [DataM] ()
    private var isDismissed =  false

    override func viewDidLoad() {
        super.viewDidLoad()
        alarmsTableView.keyboardDismissMode = .onDrag
        self.JASearchBar?.delegate =  self
        callAlarmAPI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    

}
extension AlarmsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmsTableViewCell", for: indexPath) as! AlarmsTableViewCell
        let alarmViewModel = self.alarmViewModel[indexPath.row]

        cell.alarmViewModel =  alarmViewModel
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        let alarmDetailVC = FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: AlarmDetailViewController.self)) as! AlarmDetailViewController
        alarmDetailVC.alrmModel = self.alarmViewModel[indexPath.row]
        
        let filtterDataM = self.arrAlarmData.filter({$0.notificationType == EnotificationType.Alarm.rawValue})
       
        
        FSHelper.share.setAlermData(modelData: filtterDataM[indexPath.row])
        
        NavigationHelper.helper.contentNavController!.pushViewController(alarmDetailVC, animated: true)
        
        
        ///// Testing for the Api
        ///
        ///
        ///
//        let request = AlarmAPI()
//        let apiLoader = APILoader(apiHandler: request)
//
//
//        apiLoader.postNotificationAPI(model:arrAlarmData[0] ) { response in
//
//            print("response>>>>\(response)")
//
//
//        } failure: { error in
//            print("error>>>>\(error)")
        }
        
        
        
        
   // }
}


extension AlarmsViewController {
    
    private func callAlarmAPI() {
        LoadingView.show()
        let request = AlarmAPI()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
                 if let error = err {
                     print(error)
                     LoadingView.hide()
                 } else {
                     if let alarmData = model?.data {
                         self.arrAlarmData = alarmData
                         self.updateAlarmFeed(feed:alarmData)
                     }
                }
             }
        }
    private func updateAlarmFeed(feed:[DataM]?) {
        self.alarmViewModel =  (feed?.filter({$0.notificationType == EnotificationType.Alarm.rawValue && ($0.isDismissed == self.isDismissed || $0.isDismissed == false)}).map({AlarmViewModel(alarmModel: $0)}))!
           DispatchQueue.main.async {
           LoadingView.hide()
            self.alarmsTableView.reloadData()
        }
        
    }
    func checkBoxHandel(isChecked:Bool) {
        self.isDismissed = isChecked
        self.updateAlarmFeed(feed: arrAlarmData)
    }
}

extension AlarmsViewController : JASearchBarDelegate {
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
         self.updateAlarmFeed(feed: arrAlarmData)
        } else {
          let filterData =     (arrAlarmData.filter({$0.notificationType == EnotificationType.Alarm.rawValue && ($0.isDismissed == self.isDismissed || $0.isDismissed == false)}).map({AlarmViewModel(alarmModel: $0)}))
           self.alarmViewModel = filterData.filter({$0.cabinetNameDescription?.lowercased().contains(searchText.lowercased()) ?? false})
            DispatchQueue.main.async {
                self.alarmsTableView.reloadData()
            }
        }
    }
    
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar) {
   
    }
    
}


