//
//  FriendTableViewCell.swift
//  Midterm_Test
//
//  Created by Karan Gajjar on 11/6/20.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet var uiImageView: UIImageView!

    @IBOutlet var txt_name: UITextView!
    
    func setTitle(model : DataModelClass)  {
        uiImageView?.image = model.image
        txt_name.text = model.name! as String
    }
}
