//
//  ViewController.swift
//  Camera
//
//  Created by 엄승주 on 1/23/24.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL : URL!
    var flagImageSave = false
    

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // open camera
    @IBAction func btnCaptureImgae(_ sender: UIButton) {
        //check camera is available
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true // set image save true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false // not edit image
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Camera inaccessable", message: "Cannot access to camera")
        }
        
    }
    
    @IBAction func btnCaptureVideo(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true // set image save true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false // not edit image
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Camera inaccessable", message: "Cannot access to camera")
        }
    }
    
    @IBAction func btnLoadImgae(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false // set image save true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true // not edit image
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Album inaccessable", message: "Cannot access to album")
        }
    }
    
    @IBAction func btnLoadVideo(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false // set image save true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false // not edit image
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Album inaccessable", message: "Cannot access to album")
        }
    }
    
    //function for alert
    func myAlert(_ title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // when end the selection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        //image
        if mediaType.isEqual(to: "public.image" as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        //video
        else if mediaType.isEqual(to: "public.movie" as String){
            if flagImageSave{
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // when not choose photo
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

