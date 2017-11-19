//
//  ViewController.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-18.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(true){
//            nextScreen(an: false);
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var welcome: UILabel!

    //MARK: Actions
    
    @IBAction func nameButton(_ sender: UIButton) {
        let name = nameText.text
        if(name == ""){
            welcome.text="Please enter a name."
            welcome.textColor=UIColor.red
        }
        else{
            //call next screen
            //nextScreen(an: true)
            performSegue(withIdentifier: "homeScreen", sender: self)

        }

    }
    
//    func nextScreen(an: Bool, sender: UI){
//        print("\n\n\n\n\\n\n\n\n\n\n HELLO")
//
//        shouldPerformSegue(withIdentifier: "homeScreen", sender: self?)
//
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("homeScreen") as! homeScreen
//        self.presentViewController(nextViewController, animated:true, completion:nil)
//    }
    
    
}

