//
//  SplashScreenViewCcontroller.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 02/09/22.
//

import UIKit
import AppAuth

class SplashScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAnimatingDotsInImageView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dashboardImageView: UIImageView!
    func showAnimatingDotsInImageView()
    {
        
        let lay = CAReplicatorLayer()
        lay.frame = CGRect(x: 0, y: 8, width: 15, height: 7) //yPos == 12
        let circle = CALayer()
        circle.frame = CGRect(x: 0, y: 0, width: 7, height: 7)
        circle.cornerRadius = circle.frame.width / 2
        circle.backgroundColor = UIColor(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1).cgColor//lightGray.cgColor //UIColor.black.cgColor
        lay.addSublayer(circle)
        lay.instanceCount = 3
        lay.instanceTransform = CATransform3DMakeTranslation(10, 0, 0)
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        anim.fromValue = 1.0
        anim.toValue = 0.2
        anim.duration = 1
        anim.repeatCount = .infinity
        circle.add(anim, forKey: nil)
        lay.instanceDelay = anim.duration / Double(lay.instanceCount)
        
        dashboardImageView.layer.addSublayer(lay)
        
    }
    
}
