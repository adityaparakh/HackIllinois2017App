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

class CaretakerViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var active: UISwitch!
    @IBOutlet weak var patients: UIView!
    @IBOutlet weak var takingpatients: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var loc:CLLocation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
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
            let dict = ["uid": FIRAuth.auth()?.currentUser?.uid, "long": self.loc?.coordinate.longitude, "lat": self.loc?.coordinate.latitude] as [String : Any]
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: dict)
        }else{
            takingpatients.text = "not taking patients"
            DataService.ds.createLive((FIRAuth.auth()?.currentUser)!.uid, user: [:])
            
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
