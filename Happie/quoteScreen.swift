import Foundation
import UIKit


class quoteScreen: UIViewController {
    @IBAction func navigationReturn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController =
            storyBoard.instantiateViewController(withIdentifier: "mainScreen")
        self.present(nextViewController, animated: true, completion:nil)
    }
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quoteLabel.text = quote
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

