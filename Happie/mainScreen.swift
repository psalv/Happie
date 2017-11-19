//
//  mainScreen.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-18.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var hit = 0

class mainScreen: UIViewController {
    
    @IBOutlet weak var happieStreak: UILabel!
    @IBAction func navigationToQuote(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController =
            storyBoard.instantiateViewController(withIdentifier: "quoteScreen")
        self.present(nextViewController, animated: true, completion:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let calendar = NSCalendar.current
        var current = Date()
        var anchor = Date(timeIntervalSinceReferenceDate: 0)
        current = calendar.startOfDay(for: current)
        anchor = calendar.startOfDay(for: anchor)

        let components = calendar.dateComponents([.day], from: anchor, to: current)
        let curDay = components.day as! Int
        
        self.fetchStreak()
        
        if(curDay > streakDay && hit == 1){
            hit = 0
            
            if(curDay > streakDay + 1){
                streak = 1
            } else {
                streak += 1
            }
            
            streakDay = curDay
        }

        self.happieStreak.text = "Happie Streak: " + String(streak)
        self.saveStreak()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.black
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
    
    func saveStreak() {
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
        people[0].setValue(streak, forKeyPath: "streak")
        people[0].setValue(streakDay, forKeyPath: "streakDay")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        happieStreak.text = "Happie Streak: " + String(streak)

    }
    
    
    
    
    func fetchStreak() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if(people.count != 0){
            streak = people[0].value(forKeyPath: "streak") as! Int
            streakDay = people[0].value(forKeyPath: "streakDay") as! Int
        }
    }
    
    
    func openPopUp(){
        hit = 1;
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
        

        for label in labels{
            label.font = label.font.withSize(35.0)
            label.textColor=UIColor.white
        }
    }
}
