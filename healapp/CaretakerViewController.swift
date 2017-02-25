//
//  CaretakerViewController.swift
//  healapp
//
//  Created by Admin on 2/25/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

class CaretakerViewController: UIViewController {

    @IBOutlet weak var active: UISwitch!
    @IBOutlet weak var patients: UIView!
    @IBOutlet weak var takingpatients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isonline()
        active.addTarget(self, action: #selector(CaretakerViewController.isonline), for: UIControlEvents.valueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func message(_ sender: Any) {
        print("message")
    }
    @IBAction func cancel(_ sender: Any) {
        print("cancel")
    }
    @IBAction func getpatientdata(_ sender: Any) {
    }
    @IBAction func directions(_ sender: Any) {
    }
    
    func isonline(){
        if active.isOn{
            let dict = ["uid": FIRAuth.auth()?.currentUser?.uid, "long": 12.22, "lat": 123.445] as [String : Any]
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: dict)
        }else{
            takingpatients.text = "not taking patients"
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: [:])
            
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