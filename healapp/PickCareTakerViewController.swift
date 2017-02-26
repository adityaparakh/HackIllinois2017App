//
//  PickCareTakerViewController.swift
//  healapp
//
//  Created by Admin on 2/25/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire

class PickCareTakerViewController: UIViewController, CLLocationManagerDelegate, UITextViewDelegate {

    @IBOutlet weak var query: UITextView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        // Do any additional setup after loading the view.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textview.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connect(_ sender: Any) {
        connectPress()
        //performSegue(withIdentifier: "topicker", sender: sender)
    }
    func connectPress() {
        var queries = self.query.text.components(separatedBy: ",")
        let body = ["query": queries]
        Alamofire.request(DB_URL, method: .post, parameters: body,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
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
     */


}
