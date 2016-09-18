//
//  ViewController.swift
//  GoTQuotes
//
//  Created by Laticia Chance on 9/5/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var quoteView: UIView!
    
    var isBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animateViewAtStart()
        callQuotes()
        
    }
    
    
    func callQuotes() {
        
        Alamofire.request("https://got-quotes.herokuapp.com/quotes?").responseJSON { response in
            
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
            //print(response)
            
            
            guard let jsonData = response.data else {return}
            
            let jsonObject = JSON(data: jsonData)
            
            guard let dictionaryOfData = jsonObject.dictionary else {return}
            
            guard let quote = dictionaryOfData["quote"]?.string else {return}
            guard let character = dictionaryOfData["character"]?.string else {return}
            
            
            self.quoteLabel.text = quote
            self.characterLabel.text = character
            self.characterLabel.textColor = UIColor.red
        }
        
    }
    
    func animateViewAtStart() {
        let startingHeight = quoteView.heightAnchor
        
        if !isBig {
            
            
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [.calculationModeLinear], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                    
                    self.quoteView.heightAnchor.constraint(equalTo: startingHeight, multiplier: 0.8).isActive = true
                    
                    // add what you want to animate
                    self.view.layoutIfNeeded()
                    
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7, animations: {
                    
                    self.quoteView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
                    
                    // add what you want to animate
                    
                    self.view.layoutIfNeeded()
                })
                
                
                
            }) { (complete) in
                
                
                self.isBig = true
            }
        } else {
            
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                    
                    self.quoteView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
                    
                    // add what you want to animate
                    self.view.layoutIfNeeded()
                    
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7, animations: {
                    
                    self.quoteView.heightAnchor.constraint(equalTo: startingHeight).isActive = true
                    
                    // add what you want to animate
                    
                    self.view.layoutIfNeeded()
                })
                
                
                
            }) { (complete) in
                
                
                self.isBig = false
            }
        }
        
    }
    
}

