//
//  ViewController.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -Properties
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    @IBOutlet weak var layoutView : layoutView!
    
    
    
    @IBOutlet weak var swipe: UIButton!
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLayoutImage1))
        layoutView?.addGestureRecognizer(imageTapGesture)

    }
    
    //MARK: -Actions
    @IBAction func didTapLayoutButton1() {
        layoutView.style = .layout1
        print("Button 1")
    }
    @IBAction func didTapLayoutButton2() {
        layoutView.style = .layout2
        print("Button 2")
    }
    @IBAction func didTapLayoutButton3() {
        layoutView.style = .layout3
        print("Button 3")
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view", sender)
    }
    
    @IBAction func didTapLayoutImage1() {
        print("Button Pressed")
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
//    @objc func importPicture() {
//        let picker = UIImagePickerController()
//        picker.allowsEditing = true
//        picker.delegate = self
//        present(picker, animated: true)
//    }
    
    @IBAction func swipeUpToShare(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            print("Swipe Up")
            let vc = UIActivityViewController(activityItems: ["Share your picture"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func swipeLeftToShare(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            print("Swipe Left")
            let vc = UIActivityViewController(activityItems: ["Share your picture"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    }
}
//MARK: -Extension
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("\(info)")
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage{
            layoutView.image1.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
