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

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var friendsTable: UITableView!
    
    var results:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
     
        Live data management
     
     */
    
    func loadData(){
        
        
        DispatchQueue.main.async {
        let ref = DataService.ds.REF_LIVE
        ref.observe(FIRDataEventType.value, with: { (snapshot) in
            DispatchQueue.main.async {
            let users = snapshot.value as? [String : AnyObject]
            for (key, val) in users! {
                
                let user = DataService.ds.REF_USERS.child(key).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                        let value = snapshot.value as? NSDictionary
                        self.results.append(value!)
                        self.friendsTable.reloadData()
                        print(self.results)
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
        
        print("hi")
        
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
            cell.create(name: match["name"] as! String, distance: match["name"] as! String, rating: match["rating"] as! Double, price: match["price"] as! Double, title:match["title"] as! String)
            return cell
        }
        else {
            return ResultCell()
        }
        
        
    }

    
    /*
     
     FUNCS
     
     */
    
    func distCalc() {
        
        let fromLoc = CLLocation(latitude: 5.0, longitude: 5.0)
        let toLoc = CLLocation(latitude: 5.0, longitude: 3.0)
        
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
    }
    
    @IBAction func addFriend(_ sender: Any) {
        
        var user:NSDictionary = [:]
            
            /*
            Alamofire.request(DB_URL + "users/name/" + input.text!)
                .responseJSON { response in
                    //print(response.request)
                    DispatchQueue.main.async {
                        
                        if let JSON = response.result.value as? NSDictionary{
                            if let user = JSON["user"] as? NSDictionary{
                                print(JSON)
                                if let name = user["name"] as? String {
                                    let fid = user["_id"] as! String
                                    self.friends.append(name)
                                    friendList.append(name)
                                    friendId[name] = fid
                                    self.friendsTable.reloadData()
                                    Alamofire.request(DB_URL + "users/" + user_id + "/friends/" + fid, method: .post, parameters: nil, encoding: JSONEncoding.default)
                                }
                            }
                        }
                    }
            }
        }
             */
    }
    
    func alert(title: String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
