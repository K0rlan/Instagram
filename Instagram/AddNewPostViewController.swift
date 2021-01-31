//
//  AddNewPostViewController.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class AddNewPostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let pickerController = UIImagePickerController()
    var image: UIImage?
    var save = false
    @IBOutlet weak var imgButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBAction func addButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        
        let actPhoto = UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
                                        self.takePhotoWithCamera() })
        alert.addAction(actPhoto)
        
        let actLibrary = UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in self.choosePhotoFromLibrary() })
        alert.addAction(actLibrary)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
    }
    func choosePhotoFromLibrary() {
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            pickerController.sourceType = .camera
            pickerController.delegate = self
            pickerController.allowsEditing = true
            present(pickerController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Fail", message: "There is no camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
                                [UIImagePickerController.InfoKey : Any]) {
        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        if let theImage = image {
            show(image: theImage)
        }
        dismiss(animated: true, completion: nil)
    }
    func show(image: UIImage) {
        imgButton.setImage(image, for: .normal)
        
    }
    @IBAction func saveAction(_ sender: UIButton) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
    }
    
}

