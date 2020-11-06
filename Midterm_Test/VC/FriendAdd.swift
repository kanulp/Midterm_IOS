//
//  FriendAdd.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendAdd: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIPickerViewDataSource, UIPickerViewDelegate{
   
    
    var pickerOptions = [String]()

    @IBOutlet var txt_family: UITextField!
    @IBOutlet var txt_name: UITextField!
    var gender : Int = 0
//  @IBOutlet var txt_gender: UITextField!
    
    @IBOutlet var picker_gender: UIPickerView!
    
    
    @IBOutlet var txt_city: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var btn_image: UIButton!
    @IBOutlet var btn_save: UIBarButtonItem!
    @IBOutlet var btn_cancel: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker_gender.delegate = self
        self.picker_gender.dataSource = self
        pickerOptions = ["Male","Female","Other"]

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pickImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
           picker.delegate = self
           let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
               action in
               picker.sourceType = .camera
               self.present(picker, animated: true, completion: nil)
           }))
           alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
               action in
               picker.sourceType = .photoLibrary
               self.present(picker, animated: true, completion: nil)
           }))
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           self.present(alert, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
          if let image = info[.originalImage] as? UIImage {
              imageView.image = image
          }
          dismiss(animated: true, completion: nil)
      }

      func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
          dismiss(animated: true, completion: nil)
      }
    
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        let family  = txt_family.text
        let name  = txt_name.text
        let city  = txt_city.text
        
        
        if (family ?? "").isEmpty {
            showAlert(title: "Family is Empty", message: "Please enter Family name")
            return
        }
        if (name ?? "").isEmpty {
             showAlert(title: "Name is Empty", message: "Please enter Name")
            return
        }

        if (city ?? "").isEmpty {
            showAlert(title: "City is Empty!", message: "Please enter City Name")
            return
        }
        if (imageView.image==nil) {
            showAlert(title: "Image is empty!", message: "Please choose Image")
            return
        }
        
    
        let model = DataModelClass(family_name: family!, name: name!, gender: gender, city: city! , image: (imageView?.image)!)

        DataModelClass.addNewData(model: model)
        let alert = UIAlertController(title: "Added \(String( name ?? "Successfully")) ", message: "New record added successfully.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: okClick))
        self.present(alert, animated: true, completion: nil)
        //self.dismiss(animated: true, completion: nil);

    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func okClick(alert: UIAlertAction!){
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                 return pickerOptions[row]
           
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
           gender = row
           
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func showAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
    }
    
}
