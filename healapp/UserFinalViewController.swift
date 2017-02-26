//
//  UserFinalViewController.swift
//  healapp
//
//  Created by Admin on 2/26/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class UserFinalViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var reviews: UILabel!
    var userData: [String:AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userData)
        name.text = userData["name"] as! String?
        distance.text = String(userData["distance"] as! Int)
        tittle.text = userData["title"] as! String?
        reviews.text = "42 reviews"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
