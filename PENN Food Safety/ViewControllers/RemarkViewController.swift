//
//  RemarkViewController.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 15/11/22.
//

import UIKit

class RemarkViewController: BaseViewController {

    @IBOutlet weak var textViewRemark: UITextView!
    
    var _alrmModel: AlarmViewModel?
    var correctActionTitle: String?
    var reasonTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionFiniesh(_ sender: UIButton) {
               let request = AlarmAPI()
                let apiLoader = APILoader(apiHandler: request)
        
        
        var alermModel = FSHelper.share.alertDataM
        
        alermModel?.remarks  = self.textViewRemark.text
        alermModel?.actionText = "JJJJJJ"
        alermModel?.reasonText = reasonTitle
//        guard let alermModel = FSHelper.share.alertDataM else {
//
//            return
//        }
        
       
        
        
            apiLoader.postNotificationAPI(model:alermModel!) { response in
        
                   print("response>>>>\(response)")
        
        
              } failure: { error in
                    print("error>>>>\(error)")
                }
                
                
                
                
           }
        
    
}
