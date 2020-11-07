//
//  FriendTableViewCell.swift
//  Midterm_Test
//
//  Created by Karan Gajjar on 11/6/20.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
           
           @IBOutlet var img: UIImageView!
           
        
        @IBOutlet var txt_name: UILabel!
        
           
           func setTitle(model : DataModelClass)  {
               img?.image = model.image
               txt_name.text = model.name! as String
           }
    
}
