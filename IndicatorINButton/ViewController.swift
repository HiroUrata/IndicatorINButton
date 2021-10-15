//
//  ViewController.swift
//  IndicatorINButton
//
//  Created by UrataHiroki on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var indicatorOnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorOnButton.frame = CGRect(x: view.frame.minX + 20, y: view.frame.maxY / 8, width: view.frame.maxX - 40, height: indicatorOnButton.frame.size.height)
        
        indicatorOnButton.layer.cornerRadius = 20.0
        
        indicatorOnButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        indicatorOnButton.layer.shadowOpacity = 0.5
        indicatorOnButton.layer.shadowRadius = 0.5

    }

    
    @IBAction func indicatorOn(_ sender: UIButton) {
        
        sender.setTitle("", for: .normal)
        
        UIButton.animate(withDuration: 0.5, delay: 0, options: .allowAnimatedContent, animations: {
            
            sender.frame = CGRect(x: self.view.center.x - (sender.frame.size.width / 7) / 2, y: sender.frame.origin.y, width: sender.frame.size.width / 7, height: sender.frame.size.height)
            sender.layer.cornerRadius = 25.0
            
        }, completion: nil)
        
        let indicator = UIActivityIndicatorView()
        indicator.frame.origin = CGPoint(x: sender.center.x, y: sender.center.y)
        indicator.color = .white
        
        view.addSubview(indicator)
        
        indicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            indicator.stopAnimating()
            
            UIButton.animate(withDuration: 0.5, delay: 0, options: .allowAnimatedContent, animations: {
                
                sender.frame = CGRect(x: self.view.frame.minX + 20, y: sender.frame.origin.y, width: self.view.frame.maxX - 40, height: sender.frame.size.height)
                sender.layer.cornerRadius = 20.0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {sender.setTitle("Indicator", for: .normal)}
                
            }, completion: nil)
            
        }
        
        
    }
    
}

