//
//  ViewController.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-18.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import UIKit
import CoreData
var name: String = ""

class ViewController: UIViewController {
    
    
    @IBOutlet var barOne: UILabel!
    @IBOutlet var barTwo: UILabel!
    @IBOutlet var barThree: UILabel!
    @IBOutlet var barFour: UILabel!
    @IBOutlet var barFive: UILabel!
    
    func save(name: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        // 3
        person.setValue(name, forKeyPath: "name")
        // 4
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barOne.backgroundColor = UIColor.init(red: 255/255, green: 110/255, blue: 64/255, alpha:0.5) //green 800
        barTwo.backgroundColor = UIColor.init(red: 255/255, green: 64/215, blue: 129/255, alpha:0.6) //teal 700
        barThree.backgroundColor = UIColor.init(red: 224/255, green: 64/255, blue: 251/255, alpha:0.7) //cyan 600
        barFour.backgroundColor = UIColor.init(red: 105/255, green: 240/255, blue: 174/255, alpha:0.8) //light blue 500
        barFive.backgroundColor = UIColor.init(red: 0/255, green: 229/255, blue: 255/255, alpha:0.9) //indigo 300
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
            self.save(name: name!)
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController =
                storyBoard.instantiateViewController(withIdentifier: "homeScreen")
            self.present(nextViewController, animated: true, completion:nil)
        }

    }
}

