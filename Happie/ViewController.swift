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

