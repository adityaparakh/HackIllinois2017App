//
//  CaretakerViewController.swift
//  healapp
//
//  Created by Admin on 2/25/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreLocation
import FirebaseDatabase
import MessageUI
import MapKit

class CaretakerViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var patientText: UITextView!
    @IBOutlet weak var active: UISwitch!
    @IBOutlet weak var patients: UIView!
    @IBOutlet weak var takingpatients: UILabel!
    @IBOutlet weak var patientstack: UIStackView!
    @IBOutlet weak var patienton: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var onlineoronsite: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    var patient:NSDictionary = [:]
    
    var locationManager: CLLocationManager = CLLocationManager()
    var loc:CLLocation? = LOCATION_CON
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
 */
        isonline()
        self.loadData()
        active.addTarget(self, action: #selector(CaretakerViewController.isonline), for: UIControlEvents.valueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let pref = UserDefaults.standard
        let uid = pref.string(forKey: "uid")
        DataService.ds.REF_USERS.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            if let active2 = value?["active"] as? NSDictionary {
                print("hi")
                self.patient = active2
                self.name.text = active2["name"] as? String
            }
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }    }
    
    @IBAction func message(_ sender: Any) {
        UIApplication.shared.open(URL(string: "sms:" + "\(self.patient["phone"])")!)
    }
    @IBAction func cancel(_ sender: Any) {
        print("cancel")
    }
    @IBAction func getpatientdata(_ sender: Any) {
        
        let pref = UserDefaults.standard
        print(pref.string(forKey: "uid"))
        self.patientText.text = "Allergies: \(self.patient["allergies"])\n" +
                                "Medications: \(self.patient["current-medication"])\n" +
                                "Phone: \(self.patient["phone"])\n" +
                                "previousdisease: \(self.patient["allergies"])\n"
    }
    @IBAction func directions(_ sender: Any) {
        
        if let url = URL(string: "http://maps.apple.com/?saddr=\(self.loc?.coordinate.latitude),\(self.loc?.coordinate.longitude)&daddr=\(self.patient["lat"]),\(self.patient["long"])") {
            UIApplication.shared.open(url)
        }
        
        
    }
    
    func isonline(){
        if active.isOn{
            let dict = ["uid": FIRAuth.auth()?.currentUser?.uid, "long": self.loc?.coordinate.longitude, "lat": self.loc?.coordinate.latitude] as [String : Any]
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: dict)
            
            patients.isHidden = false
            patientstack.isHidden = false
            patienton.isHidden = true
        }else{
            takingpatients.text = "Not taking patients"
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: [:])
            patients.isHidden = true
            patientstack.isHidden = true
            patienton.isHidden = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            self.loc = location
        }
        else {
            print("YOLO")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
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
