//
//  FriendScene.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendScene: UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var txt_city: UITextView!
    @IBOutlet var txt_gender: UITextView!
    @IBOutlet var txt_name: UITextView!
    var model : DataModelClass?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        txt_city.text = "\(model?.city ?? "")"
        
        if(model?.gender==0){
            txt_gender.text = "Male"
        }
        else if(model?.gender==1){
            txt_gender.text = "Female"
        }
        else{
            txt_gender.text = "Other"
        }
        
        txt_name.text = "\(model?.name  ?? "")"
        imageView.image = model?.image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
