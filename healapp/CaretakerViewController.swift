//
//  CaretakerViewController.swift
//  healapp
//
//  Created by Admin on 2/25/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CaretakerViewController: UIViewController {

    @IBOutlet weak var active: UISwitch!
    @IBOutlet weak var patients: UIView!
    @IBOutlet weak var takingpatients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            print("lol")
        }else{
            takingpatients.text = "Not taking patients"
            
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
