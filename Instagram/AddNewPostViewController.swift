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
    
    @IBOutlet weak var imgButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBAction func addButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        let actPhoto = UIAlertAction(title: "Сделать фото", style: .default, handler: { _ in self.takePhotoWithCamera() })
        alert.addAction(actPhoto)
        let actLibrary = UIAlertAction(title: "Загрузить из галереи", style: .default, handler: { _ in self.choosePhotoFromLibrary() })
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
            let alert = UIAlertController(title: "Ошибка", message: "Нету камеры", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
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
        self.image = image
        
    }
    @IBAction func saveAction(_ sender: UIButton) {
        guard let img = self.image else { return }
        guard let text = textField.text else { return }
        let post = Posts(user: Stories(name: "Koko", image: "1"), postImage: img, postText: text)
        
        Post.sharedInstance.arr.append(post)
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

