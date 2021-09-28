//
//  NewNoteViewController.swift
//  App for CFT
//
//  Created by pavel mishanin on 28.09.2021.
//

import UIKit

class NewNoteViewController: UITableViewController, UINavigationControllerDelegate {
    
    var newModel: Model?

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageOfNote: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.isEnabled = false
        
        titleTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) {_ in
                self.chooseImagePicker(source: .camera)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            }
            let photo = UIAlertAction(title: "Photo", style: .default) {_ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            alert.addAction(camera)
            alert.addAction(cancel)
            alert.addAction(photo)
            
            present(alert, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewNote() {
        newModel = Model(title: titleTextField.text!, subTitle: noteTextField.text, image: nil, newImage: imageOfNote.image)
    }
    // Возврат на предыдущий экран по нажатию на кнопку Cancel
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: Text Field

extension NewNoteViewController: UITextFieldDelegate {
    // Скрываем клавиатуру по нажатию на Done

    func textFieldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc private func textFieldChanged(){
        if titleTextField.text?.isEmpty == true {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
    
}

// MARK: - Work with image

extension NewNoteViewController: UIImagePickerControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        present(imagePicker, animated: true)
    }
    
    // Присвоить выбранное фото из галереи в image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfNote.image = info[.editedImage] as? UIImage
        imageOfNote.contentMode = .scaleAspectFill
        imageOfNote.clipsToBounds = true
        dismiss(animated: true)
    }
}
