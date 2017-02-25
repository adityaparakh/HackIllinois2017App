//
//  ProfileForCareTakerViewController.swift
//  healapp
//
//  Created by Admin on 2/26/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ProfileForCareTakerViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var tittle: UITextField!
    @IBOutlet weak var specialization: UITextField!
    @IBOutlet weak var hourly: UITextField!
    var userData = ["name": "Alena Hawk", "phone": "3125369986", "title": "-", "spec": "-", "hourly": "-"] as [String : Any]
    var user: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func save(_ sender: Any) {
        userData["name"] = name.text!
        userData["phone"] = phone.text!
        userData["title"] = tittle.text!
        userData["spec"] = specialization.text!
        userData["hourly"] = hourly.text!
        DataService.ds.createUser(user, user: userData )
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "caretakerhome", sender: self)
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
