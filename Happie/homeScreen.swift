//
//  homeScreen.swift
//  Happie
//
//  Created by Gurkiran Tatla on 2017-11-18.
//  Copyright © 2017 GP Productions. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class homeScreen: UIViewController {
    @IBOutlet var barOne: UILabel!
    @IBOutlet var barTwo: UILabel!
    
    @IBOutlet var barThree: UILabel!
    
    @IBOutlet var barFour: UILabel!
    @IBOutlet var barFive: UILabel!

    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 1)
        
        barOne.backgroundColor = UIColor.init(red: 255/255, green: 110/255, blue: 64/255, alpha:0.4) //green 800
        barTwo.backgroundColor = UIColor.init(red: 255/255, green: 64/215, blue: 129/255, alpha:0.5) //teal 700
        barThree.backgroundColor = UIColor.init(red: 224/255, green: 64/255, blue: 251/255, alpha:0.5) //cyan 600
        barFour.backgroundColor = UIColor.init(red: 105/255, green: 240/255, blue: 174/255, alpha:0.8) //light blue 500
        barFive.backgroundColor = UIColor.init(red: 0/255, green: 229/255, blue: 255/255, alpha:0.9) //indigo 300
        
        welcomeLabel.text = "Welcome, " + name + "."
        welcomeLabel.font = welcomeLabel.font.withSize(40.0)
        self.scheduleNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController =
            storyBoard.instantiateViewController(withIdentifier: "mainScreen")
        self.present(nextViewController, animated: true, completion:nil)
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Hello from Happie!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Take a moment for your own happiness, you deserve it.",
                                                                arguments: nil)
        content.sound = UNNotificationSound.default()

        // Configure the trigger for a 7am wakeup.
        var dateInfo = DateComponents()
        dateInfo.hour = 18
        dateInfo.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
        
        // Create the request object.
        let request = UNNotificationRequest(identifier: "HappieReminder", content: content, trigger: trigger)
    
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
    }


}
