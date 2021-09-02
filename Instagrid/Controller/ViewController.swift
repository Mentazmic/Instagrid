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
    
    @IBOutlet weak var layoutView : LayoutView!

    @IBOutlet weak var swipe: UIButton!
    
    private var buttonSelect: Int = 0
    
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
    
    @IBAction func didTapLayoutImage1(_ sender: UITapGestureRecognizer) {
        print("Button Pressed", sender)
        buttonSelect = sender.view?.tag ?? 1
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        
        if UIDevice.current.orientation.isPortrait && sender.direction == .up{
            if sender.state == .ended {
                print("Swipe Up")
                let renderer = UIGraphicsImageRenderer(size: layoutView.bounds.size)
                let image = renderer.image { ctx in
                    layoutView.drawHierarchy(in: layoutView.bounds, afterScreenUpdates: true)
                }
                let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                vc.popoverPresentationController?.sourceView = self.view
                self.present(vc, animated: true, completion: nil)
            }
        } else if UIDevice.current.orientation.isLandscape && sender.direction == .left {
            if sender.state == .ended{
                print("Swipe Left")
                let renderer = UIGraphicsImageRenderer(size: layoutView.bounds.size)
                let image = renderer.image { ctx in
                    layoutView.drawHierarchy(in: layoutView.bounds, afterScreenUpdates: true)
                }
                let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                vc.popoverPresentationController?.sourceView = self.view
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
//MARK: -Extension
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("\(info)")
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage{
            //layoutView.image1.image = image
            
                        let selection = buttonSelect
                        switch selection {
                        case 1:
                            layoutView.image1.image = image
                        case 2:
                            layoutView.image2.image = image
                        case 3:
                            layoutView.image3.image = image
                        case 4:
                            layoutView.image4.image = image
                        default:
                            break
                        }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
