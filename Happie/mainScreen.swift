//
//  mainScreen.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-18.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import Foundation
import UIKit

class mainScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 33/255, green: 150/255, blue: 243/255, alpha:1) //blue 500
        startUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private var labels=[UILabel]()

    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var footerText: UILabel!
    
    @IBOutlet weak var random: UILabel!
    @IBOutlet weak var gratitude: UILabel!
    @IBOutlet weak var medidate: UILabel!
    @IBOutlet weak var walk: UILabel!
    @IBOutlet weak var journal: UILabel!
    
    
    
    
    func startUp(){
        labels.append(random)
        labels.append(gratitude)
        labels.append(medidate)
        labels.append(walk)
        labels.append(journal)
        
//        headerText.backgroundColor=UIColor.init(red: 26/255, green: 35/255, blue: 126/255, alpha:1) //indigo 900
//        footerText.backgroundColor=UIColor.init(red: 26/255, green: 35/255, blue: 126/255, alpha:1) //indigo 900
        headerText.backgroundColor=UIColor.black
        footerText.backgroundColor=UIColor.black
        headerText.textColor=UIColor.white
        headerText.font=headerText.font.withSize(20.0)
        
        
        for label in labels{
            label.font = label.font.withSize(35.0)
            label.backgroundColor=UIColor.white
//            label.textColor=UIColor.init(red: 13/255, green: 71/255, blue: 161/255, alpha:1) //blue 900
            label.textColor=UIColor.black
        }
        

    }
    
}
