//
//  popUpViewController.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-19.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import UIKit

class popUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAnimate()
        self.view.backgroundColor=UIColor.black
        startUp()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var congratsLabel: UILabel!
    
    @IBOutlet var quoteLabel: UILabel!
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainScreen") as! mainScreen
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        self.view.removeFromSuperview()
        self.removeAnimate()

    }
    
    @IBOutlet var popUpViewScreen: popUpViewController!

    @IBOutlet var backgrounControl: UILabel!
    
    func startUp(){

        congratsLabel.text="Congratulations!"
        congratsLabel.font = congratsLabel.font.withSize(35.0)
        congratsLabel.textColor=UIColor.white
        
        quoteLabel.font = congratsLabel.font.withSize(16.0)
        quoteLabel.textColor=UIColor.white
        
        if(currentActivity==0){
            quoteLabel.text="'Nature walks can give you peace and quiet, while increasing the strength of your heart and lungs.' Good work! "
            backgrounControl.backgroundColor=UIColor.init(red: 255/255, green: 110/255, blue: 64/255, alpha:1) //green 800
            
        }
        else if(currentActivity==1){
            quoteLabel.text="'Journalling helps you understand your own thoughts and feelings, giving you more control of your emotions.' Well done! "
            backgrounControl.backgroundColor=UIColor.init(red: 255/255, green: 64/215, blue: 129/255, alpha:1) //teal 700

        }
        else if(currentActivity==2){
            quoteLabel.text="'Meditation is a practice in focusing your attention and being aware when it drifts, creating a lasting effect on your concentration.' Nice!"
            backgrounControl.backgroundColor=UIColor.init(red: 224/255, green: 64/255, blue: 251/255, alpha:1) //cyan 600

        }
        else if(currentActivity==3){
            quoteLabel.text="'By noting what you are grateful for, you can gain clarity on what you want to have more of in your life, and what you can do without.' Hmm..."
            backgrounControl.backgroundColor = UIColor.init(red: 105/255, green: 240/255, blue: 174/255, alpha:1) //light blue 500

        }
        else if(currentActivity==4){
            quoteLabel.text="'When we feel Love and Kindness towards others, it not only makes others feel loved and cared for, but it helps us also to develop inner Happiness and Peace'"
            backgrounControl.backgroundColor = UIColor.init(red: 0/255, green: 229/255, blue: 255/255, alpha:1) //indigo 300

        }
        else{

        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
