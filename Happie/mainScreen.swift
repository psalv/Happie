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
    
    @IBAction func navigationToQuote(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController =
            storyBoard.instantiateViewController(withIdentifier: "quoteScreen")
        self.present(nextViewController, animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.black
        //self.view.backgroundColor = UIColor.init(red: 33/255, green: 150/255, blue: 243/255, alpha:1) //blue 500
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
    
    func openPopUp(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpViewController") as! popUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func walkClick(_ sender: UIButton) {
        walk.backgroundColor = UIColor.init(red: 255/255, green: 110/255, blue: 64/255, alpha:0.6) //green 800
        currentActivity=0;
        openPopUp()
        
    }
    
    @IBAction func journalClick(_ sender: UIButton) {
        journal.backgroundColor = UIColor.init(red: 255/255, green: 64/215, blue: 129/255, alpha:0.6) //teal 700
        currentActivity=1;
        openPopUp()
    }
    
    @IBAction func meditateClick(_ sender: UIButton) {
        medidate.backgroundColor = UIColor.init(red: 224/255, green: 64/255, blue: 251/255, alpha:0.6) //cyan 600
        currentActivity=2;
        openPopUp()
    }
    
    @IBAction func gratitudeClick(_ sender: UIButton) {
        gratitude.backgroundColor = UIColor.init(red: 105/255, green: 240/255, blue: 174/255, alpha:0.6) //light blue 500
        currentActivity=3;
        openPopUp()
    }
    
    @IBAction func randomClick(_ sender: UIButton) {
        random.backgroundColor = UIColor.init(red: 0/255, green: 229/255, blue: 255/255, alpha:0.6) //indigo 300
        currentActivity=4;
        openPopUp()
    }
    
    
    func startUp(){
        
        walk.backgroundColor = UIColor.init(red: 255/255, green: 110/255, blue: 64/255, alpha:1) //green 800
        journal.backgroundColor = UIColor.init(red: 255/255, green: 64/215, blue: 129/255, alpha:1) //teal 700
        medidate.backgroundColor = UIColor.init(red: 224/255, green: 64/255, blue: 251/255, alpha:1) //cyan 600
        gratitude.backgroundColor = UIColor.init(red: 105/255, green: 240/255, blue: 174/255, alpha:1) //light blue 500
        random.backgroundColor = UIColor.init(red: 0/255, green: 229/255, blue: 255/255, alpha:1) //indigo 300

        
        
        labels.append(random)
        labels.append(gratitude)
        labels.append(medidate)
        labels.append(walk)
        labels.append(journal)
        
//        headerText.backgroundColor=UIColor.init(red: 26/255, green: 35/255, blue: 126/255, alpha:1) //indigo 900
//        footerText.backgroundColor=UIColor.init(red: 26/255, green: 35/255, blue: 126/255, alpha:1) //indigo 900

        
        
        for label in labels{
            label.font = label.font.withSize(35.0)
//            label.textColor=UIColor.init(red: 13/255, green: 71/255, blue: 161/255, alpha:1) //blue 900
            label.textColor=UIColor.white
        }
        
        
        
        
        
        

    }
    
}
