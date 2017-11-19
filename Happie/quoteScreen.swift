//
//  quoteScreen.swift
//  Happie
//
//  Created by Paul Salvatore on 2017-11-19.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import Foundation
import UIKit

// data['data']['children'][0]['data']['title']
class quoteScreen: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    let quoteLink: String = "https://www.reddit.com/r/quotes/top/.json?limit=1&jsonp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
