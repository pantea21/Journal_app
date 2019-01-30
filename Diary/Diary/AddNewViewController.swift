//
//  AddNewViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/29/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var imageNew: UIImageView!
    @IBOutlet weak var textNew: UITextView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.delegate = self
        textNew.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func SelectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        titleText.resignFirstResponder()
        textNew.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imageNew.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTheContent(_ sender: UIButton) {
        subjects.append(String?(titleText.text!)!)
        number_image.append(imageNew.image!)
        number_text.append(textNew.text)
        print(subjects)
        //SAVE THE DATA
        UserDefaults.standard.set(subjects, forKey:"subjects" )
        var imageData :[NSData] = []
        for image in number_image {
            imageData.append(UIImagePNGRepresentation(image)! as NSData)
            
        }
        UserDefaults.standard.set(imageData, forKey:"number_image" )
        UserDefaults.standard.set(number_text, forKey:"number_text" )
        UserDefaults.standard.set(flag, forKey:"flag" )
    }
    

}
