//
//  FriendScene.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendScene: UIViewController,UIScrollViewDelegate{
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var scrollImg: UIScrollView!
    
    @IBOutlet var txt_fam: UITextView!
    @IBOutlet var txt_city: UITextView!
    @IBOutlet var txt_gender: UITextView!
    @IBOutlet var txt_name: UITextView!
    
    var model : DataModelClass?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        txt_city.text = "\(model?.city ?? "")"
        txt_fam.text = "\(model?.family_name ?? "") "
        
        txt_gender.text = getGenderText(i: model?.gender ?? 99)
    
        txt_name.text = "\(model?.name  ?? "")"
        imageView.image = model?.image
        
       
        imageView.isUserInteractionEnabled = true
        scrollImg.delegate = self
        
        scrollImg.minimumZoomScale = 1.0
               scrollImg.maximumZoomScale = 10.0

               let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapScrollView(recognizer:)))
               doubleTapGest.numberOfTapsRequired = 2
               scrollImg.addGestureRecognizer(doubleTapGest)

               self.view.addSubview(scrollImg)

               scrollImg.addSubview(imageView!)

    }
    
    @objc func handleDoubleTapScrollView(recognizer: UITapGestureRecognizer) {
        if scrollImg.zoomScale == 1 {
            scrollImg.zoom(to: zoomRectForScale(scale: scrollImg.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        } else {
            scrollImg.setZoomScale(1, animated: true)
        }
    }

    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width  = imageView.frame.size.width  / scale
        let newCenter = imageView.convert(center, from: scrollImg)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    
    
    
    func getGenderText(i:Int) -> String {
        
        if(i==0){
            return "Male"
        }else if(i==1){
            return "Female"
        }else if(i==2) {
            return "Other"
        }else{
            return "Not Specified"
        }
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
