//
//  HomeViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var refrigerationCollectionView: UICollectionView!
    
    fileprivate static let refrigerationDetailIdentifier = "RefrigerationViewController"
    fileprivate var estimateWidth  = 160.0
    fileprivate var cellMarginSize  = 16.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Menu Button Tint Color
        navigationController?.navigationBar.tintColor = .white
//        self.view.backgroundColor = UIColor.blue
        //self.navigationController?.popToRootViewController(animated: true)
        
        refrigerationCollectionView.register(UINib.init(nibName: "RefrigerationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        refrigerationCollectionView.delegate = self
        refrigerationCollectionView.dataSource = self
                
        refrigerationCollectionView.isUserInteractionEnabled = true
//        sideMenuBtn.target = revealViewController()
//        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        self.setupGridView()
    }
    
    func setupGridView() {

        let flow = refrigerationCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle("Dashboard")
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return refrigerationData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? RefrigerationCollectionViewCell
        cell?.setup(with: refrigerationData[indexPath.row])
        
        return cell!
        
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(#function)
        // let padding: CGFloat =  40
        // let collectionViewSize = collectionView.frame.size.width - padding
        // return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
        
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select item")
        let vc =   FSConstants.Storyboard.cabinetStoryboard.instantiateViewController(withIdentifier: String(describing: SegementedVC.self)) as! SegementedVC
        
      //  let vc = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: DetailsViewController.self) as? DetailsViewController
       NavigationHelper.helper.contentNavController?.pushViewController(vc, animated: true)
        
        
    }
}

extension HomeViewController {
    
    func calculateWith() -> CGFloat {
        
        let estimateWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
        
    }
}
