//
//  SecondViewController.swift
//  SwiftApp
//
//  Created by Aqueel Miqdad on 1/21/17.
//  Copyright © 2017 ADAQ. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import FirebaseDatabase
import FirebaseAuth
import MapKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate  {
    
    @IBOutlet weak var friendsTable: UITableView!
    
    var results:[NSDictionary] = []
    var locationManager: CLLocationManager = CLLocationManager()
    var loc:CLLocation! = LOCATION_CON
    var i = 0;
    var boop:[String:AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("location")
        print(loc)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        self.loadData()
        
        self.friendsTable.delegate = self
        self.friendsTable.dataSource = self
        self.friendsTable.rowHeight = 150
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     
     */
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            self.loc = location
            print(self.loc)
        }
        else {
            print("YOLO")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    
    /*
     
        Live data management
     
     */
    
    func loadData(){
        
        locationManager.requestLocation()
        DispatchQueue.main.async {
        let ref = DataService.ds.REF_LIVE
        ref.observe(FIRDataEventType.value, with: { (snapshot) in
            DispatchQueue.main.async {
            let users = snapshot.value as? [String : AnyObject]
            print(users)
            self.results = []
            for (key, val) in users! {
                let d = val as! Dictionary<String, AnyObject>
                let user = DataService.ds.REF_USERS.child(key).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    var value = snapshot.value as! Dictionary<String, AnyObject>
                    let dt = [
                        "name":value["name"],
                        "phone":value["phone"],
                        "hourly":value["hourly"],
                        "rating":3.5,
                        "title":value["title"],
                        "distance": self.distCalc(gX: d["lat"] as! Double, gY: d["long"] as! Double),
                        "uid": val["uid"]!
                        ] as [String : Any]
                    self.results.append(dt as NSDictionary)
                    self.friendsTable.reloadData()
                    // ...
                }) { (error) in
                    print(error.localizedDescription)
                }

            }
            }
        })
        }
        
    }
    
    /*
     
     TableView Stuff
     
     */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let picked = results[indexPath.row] as! [String:Any]
        boop = picked as [String : AnyObject]
        let preferences = UserDefaults.standard
        let uid = preferences.string(forKey: "uid")
        DataService.ds.REF_CLIENTS.child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print(snapshot.value)
            let value = snapshot.value as! Dictionary<String, AnyObject>
            let dt = [
                "name": value["name"],
                "phone": value["phone"],
                "lat": self.loc?.coordinate.latitude,
                "long": self.loc?.coordinate.longitude,
                "current-medication": value["current-medication"],
                "allergies": value["allergies"],
                "previousdisease": value["previousdisease"]
            ] as [String : Any]
            DataService.ds.REF_USERS.child(picked["uid"] as! String).child("active").setValue(value)
            self.performSegue(withIdentifier: "bookedsegue", sender: self)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let match = self.results[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resultcell") as? ResultCell {
            cell.create(name: match["name"] as! String, distance: "\(match["distance"] as! Int)", rating: 45, price: Double(match["hourly"] as! String)!, title: match["title"] as! String)
            return cell
        }
        else {
            return ResultCell()
        }
        
        
    }

    
    /*
     
     FUNCS
     
     */
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    }
    
    func distCalc(gX: Double, gY: Double) -> Int {
        
        let fromLoc = CLLocation(latitude: gX, longitude: gY)
        return Int(self.loc!.distance(from: fromLoc)/1649)
    }
    
    
    func alert(title: String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "bookedsegue") {
            var svc = segue.destination as! UserFinalViewController
            svc.userData = boop
        }
    }

    
}
