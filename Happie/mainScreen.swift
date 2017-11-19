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
        self.view.backgroundColor = UIColor.gray
        super.viewDidLoad()
        startUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private var labels=[UILabel]()

    @IBOutlet weak var headerText: UILabel!
    
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
        headerText.font = headerText.font.withSize(25.0)
        
        for label in labels{
            label.font = label.font.withSize(35.0)
            label.backgroundColor=UIColor.white
            label.textColor=UIColor.gray
        }
        

    }
    
    
    
}
