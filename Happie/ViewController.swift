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
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController =
                storyBoard.instantiateViewController(withIdentifier: "homeScreen")
            self.present(nextViewController, animated: false, completion:nil)
        }
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
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController =
                storyBoard.instantiateViewController(withIdentifier: "homeScreen")
            self.present(nextViewController, animated: true, completion:nil)
        }

    }
}

