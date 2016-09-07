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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        callQuotes()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        view.
        
    }
    
    func callQuotes() {
        
        Alamofire.request(.GET, "https://got-quotes.herokuapp.com/quotes?").responseJSON {(response)  in
            
            //print(response)
            
            
            guard let jsonData = response.data else {return}
            
            let jsonObject = JSON(data: jsonData)
            
            guard let dictionaryOfData = jsonObject.dictionary else {return}
            
            guard let quote = dictionaryOfData["quote"]?.string else {return}
            guard let character = dictionaryOfData["character"]?.string else {return}
            
            
            self.quoteLabel.text = quote
            self.characterLabel.text = character
            self.characterLabel.textColor = UIColor.redColor()
        }
        
    }
    
    func animateView() {
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

