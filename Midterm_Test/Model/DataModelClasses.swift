//
//  DataModelClasses.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import Foundation
import UIKit

class DataModelClass : NSObject {
        
    var family_name : String!
    var name : String!
    var gender : Int!
    var city : String!
    var image : UIImage!
    
    init(family_name : String,name:String,gender:Int,city:String,image:UIImage) {
        self.family_name = family_name
        self.name = name
        self.gender = gender
        self.city = city
        self.image = image
    }
    
    static var friends : [DataModelClass]? = [DataModelClass]()

    static func addNewData(model:DataModelClass) {
        friends?.append(model)
        friends?.sort {
          ($0.family_name, $0.name) <
            ($1.family_name, $1.name)
        }
    }
    
    static func getData(i:Int) -> DataModelClass {
        return friends![i]
    }
    

    
}
