//
//  ImagePicker.swift
//  Cognitive Services
//
//  Created by Hayden Do on 23/09/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

public protocol ImagePickerDelegate: class {
    func didSelectImage(image: UIImage?)
}

open class ImagePicker: NSObject, UINavigationControllerDelegate {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    // Initialisation
    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        
        self.pickerController = UIImagePickerController()
        
        super.init()
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        
        self.presentationController = presentationController
        self.delegate = delegate
    }
    
    // UI Alert Action based on source type
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    // Present alert controller
    public func present() {
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Camera") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        
        // Delegate method call
        self.delegate?.didSelectImage(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    // Delegate function for didFinishPickingMediaWithInfo
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
    
    // Delegate function for cancel
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
}
