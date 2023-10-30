//
//  AddNewItemToListViewController.swift
//  tableViewLearn
//
//  Created by Levan Loladze on 30.10.23.
//

import UIKit


protocol SongNameDelegate{
    func didEnterSongName(name: String)
}

class AddNewItemToListViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   

    var delegate: SongNameDelegate?
    let imagePicker = UIImagePickerController()

    
    let textFieldSong: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Song Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 53).isActive = true
        return textField
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let save: UIButton = {
        let button = UIButton()
        button.setTitle("save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        setupTextField()
        setupSaveButton()
        save.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Select Image Source", message: nil, preferredStyle: .actionSheet)
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonTapped() {
        delegate?.didEnterSongName(name: textFieldSong.text ?? "quasimoto")
        navigationController?.popViewController(animated: true)
        print("sfnajfka")
    }
    
    func setupTextField() {
        view.addSubview(textFieldSong)
        
        NSLayoutConstraint.activate([
            textFieldSong.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textFieldSong.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldSong.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setupSaveButton() {
        view.addSubview(save)
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            save.topAnchor.constraint(equalTo: textFieldSong.bottomAnchor, constant: 30),
            save.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: save.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
   
    
   
}
