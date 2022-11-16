//
//  ViewController.swift
//  Demo2
//
//  Created by Varun Shukla on 27/09/22.
//

import UIKit

import UIKit
protocol SegementedVCDelegate:AnyObject {
    func isCheckBox(isChecked:Bool)
}


class SegementedVC: BaseViewController {
    @IBOutlet weak var buttonFilter: UIButton!
    
    @IBOutlet weak var searchBGViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var segmentControl   : UISegmentedControl!
    @IBOutlet weak var containerView    : UIView!
    @IBOutlet weak var searchBgView: JASearchBar!
    weak var delegate: SegementedVCDelegate?
    let checkedImage = UIImage(named: "CheckBoxDelSected")! as UIImage
    let uncheckedImage = UIImage(named: "CheckBoxSelected")! as UIImage
    private lazy var cabinetViewController: CabinetsViewController = {
        let storyboard = FSConstants.Storyboard.cabinetStoryboard
 
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CabinetsViewController") as! CabinetsViewController
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        return viewController
        
    }()
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.alarmsViewController.checkBoxHandel(isChecked: true)
                self.buttonFilter.setImage(uncheckedImage, for: .normal)
            } else {
                self.alarmsViewController.checkBoxHandel(isChecked: false)
                self.buttonFilter.setImage(checkedImage, for: .normal)
            }
        }
    }
    
    private lazy var alarmsViewController: AlarmsViewController = {
        // Load Storyboard
        let storyboard = FSConstants.Storyboard.cabinetStoryboard
        
     
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "AlarmsViewController") as! AlarmsViewController
       // self.delegate = viewController.delagte
        viewController.JASearchBar = searchBgView
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
        
    }()
    
    static func viewController() -> SegementedVC {
        return UIStoryboard.init(name: "Cabinet", bundle: nil).instantiateViewController(withIdentifier: "SegementedView") as! SegementedVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func actionButtonFilter(_ sender: UIButton) {
        isChecked = !isChecked
       
    }
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    //----------------------------------------------------------------
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    //----------------------------------------------------------------
    
    private func updateView() {
        self.view.endEditing(true)
       
        if segmentControl.selectedSegmentIndex == 0 {
            searchBGViewHeightConstraint.constant = 0.0
            searchBgView.isHidden = true
            buttonFilter.isHidden = true
           // remove(asChildViewController: alarmsViewController)
            add(asChildViewController: cabinetViewController)
        } else {
            searchBGViewHeightConstraint.constant = 65.0
            searchBgView.isHidden = false
            buttonFilter.isHidden = false
            remove(asChildViewController: cabinetViewController)
            add(asChildViewController: alarmsViewController)
        }
    }
    
    //----------------------------------------------------------------
    
    func setupView() {
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.searchBgView.layer.cornerRadius = 16.0
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       }
}


