//
//  FriendListTableViewController.swift
//  Midterm_Test
//  Write Your name Here
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendList: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //var friends: [DataModelClass] = [DataModelClass]()
    //var dataModel : DataModelClass?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //dataModel = DataModelClass()
        //friends = DataModelClass.friends!
        //friends.append(DataModelClass(family_name: "fam", name: //"name", gender: 1, city: "city", image: UIImage()))
        tableView.dataSource = self
        tableView.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView?.reloadData()
        
    }


    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModelClass.friends!.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FriendTableViewCell
          
        let friend = DataModelClass.friends![indexPath.row]
                  cell.setTitle(model: friend)
                  return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               print("You tapped cell number \(indexPath.row).")

              let friendScene = storyboard?.instantiateViewController(identifier: "FriendScene") as? FriendScene

        friendScene?.model = (DataModelClass.friends?[indexPath.row])! as DataModelClass

              self.navigationController?.pushViewController(friendScene!, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
}
class FriendTableViewCell: UITableViewCell {
       
       @IBOutlet var img: UIImageView!
       
       @IBOutlet var txt_name: UITextView!
       
       
       func setTitle(model : DataModelClass)  {
           img?.image = model.image
           txt_name.text = model.name! as String
       }
}
