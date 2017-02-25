//
//  SecondViewController.swift
//  SwiftApp
//
//  Created by Aqueel Miqdad on 1/21/17.
//  Copyright © 2017 ADAQ. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var friendsTable: UITableView!
    
    var friends:[String] = ["Mete", "Aqueel", "Paolo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.friendsTable.delegate = self
        self.friendsTable.dataSource = self
        loadFriends()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFriends() {
        
        /*
        Alamofire.request(DB_URL + "users/" + user_id)
            .responseJSON { response in
                DispatchQueue.main.async {
                    if let JSON = response.result.value as? NSDictionary{
                        if let user = JSON["user"] as? NSDictionary {
                            if let frnds = user["friendsList"] as? NSArray {
                                
                                for friend in frnds {
                                    let item = friend as! String
                                    print(item)
                                    Alamofire.request(DB_URL + "users/" + item)
                                        .responseJSON { response in
                                            DispatchQueue.main.async {
                                                //print(response)
                                                if let JSON = response.result.value as? NSDictionary{
                                                    if let user = JSON["user"] as? NSDictionary{
                                                        if let name = user["name"] as? String {
                                                            self.friends.append(name)
                                                            friendList.append(name)
                                                            friendId[name] = item
                                                            self.friendsTable.reloadData()
                                                        }
                                                    }
                                                }
                                            }
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                }
        }
         */
    }
    
    /*
     
     TableView Stuff
     
     */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let match = self.friends[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell") as? ResultCell {
            cell.name.text = match
            print("Hello")
            return cell
        }
        else {
            return ResultCell()
        }
        
        
    }
    
    /*
     
     FUNCS
     
     */
    
    @IBAction func addFriend(_ sender: Any) {
        
        var user:NSDictionary = [:]
        
        if((input.text?.characters.count)! < 2) {
            alert(title: "Empty Friend Name", msg: "Please search for a valid friend");
        }
        else {
            
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
