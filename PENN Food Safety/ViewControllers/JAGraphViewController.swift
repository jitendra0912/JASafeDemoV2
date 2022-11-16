//
//  JAGraphViewController.swift
//  JASafeDemoV
//
//  Created by Jitendra.Agarwal2 on 09/11/22.
//

import UIKit
import Highcharts

class JAGraphViewController: BaseViewController {
    @IBOutlet weak var oneDayButton: JACustomButton!
    @IBOutlet weak var oneWeekButton: JACustomButton!
    @IBOutlet weak var oneMonthButton: JACustomButton!
    @IBOutlet weak var threeMonthButton: JACustomButton!
    @IBOutlet weak var customeButton: JACustomButton!
    var model : CabinetViewModel?
    
    var sources: [[String:Any]]!
    var data: [Any]!
    var dataName: String!
    var charts: [HIChartView]!
    
    @IBOutlet weak var chartView: HIChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataName = "day"
        self.loadSourcesAndData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle(model?.cabinetDescription ?? "")
        self.updateMenuButton(type: .back)
    }
    
   private var resetColor:UIColor {
        UIColor.lightGray
    }
    private var highlightedColor:UIColor {
         UIColor.link
     }
    
    private func resetBackgroundColor() {
        self.oneDayButton.backgroundColor = resetColor
        self.oneWeekButton.backgroundColor = resetColor
        self.oneMonthButton.backgroundColor = resetColor
        self.threeMonthButton.backgroundColor = resetColor
        self.customeButton.backgroundColor = resetColor
    }
    @IBAction func actionDateCollection(_ sender: UIButton) {
        let currentDate = Date()
        self.resetBackgroundColor()
            guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
       case 900:
          var updateDate = currentDate.addOrSubtructDay(day: -1)
            self.oneDayButton.backgroundColor =  highlightedColor
        case 901:
            var updateDate = currentDate.addOrSubtructDay(day: -7)
            self.oneWeekButton.backgroundColor =  highlightedColor
         case 902:
            var updateDate = currentDate.addOrSubtructDay(day: -1)
            self.oneMonthButton.backgroundColor =  highlightedColor
        case 903:
            var updateDate = currentDate.addOrSubtructDay(day: -3)
            self.threeMonthButton.backgroundColor =  highlightedColor
        case 904:
            self.customeButton.backgroundColor =  highlightedColor
        default:
            print("noting")
            return
        }
    }
    private func loadSourcesAndData() {
        self.data = [Any]()
        self.charts = [HIChartView]()
        self.sources = (UserDefaults.standard.value(forKey: "sources") as! [[String: Any]])
        var tmpData = [Any]()
        var configFilePath = Bundle.main.path(forResource: "DataCaloriesIn", ofType: "json")
        var sourceData = try? Data(contentsOf: URL(fileURLWithPath: configFilePath!))
        var sourceJson = try? JSONSerialization.jsonObject(with: sourceData!)
        tmpData.append(sourceJson)
        self.data = tmpData
        let seriesData = self.data[0] as! [String: Any]
        let series = seriesData[self.dataName] as! [Int]
        var sum = 0
        for number in series {
            sum += number
        }
        var options = self.sources[0]
        options["subtitle"] = "\(sum) \(options["unit"]!)"
        let customeView = HIChartView(frame: CGRect(x: 10.0, y: 120.0, width: (self.view.bounds.size.width - 20), height: 240.0))
        customeView.backgroundColor =  .clear
        self.view.addSubview(customeView)
        customeView.options = OptionsProvider.provideOptions(forChartType: options, series: series, type: "day")
      
    }
    
}
