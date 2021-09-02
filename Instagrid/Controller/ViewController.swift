//
//  ViewController.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -Properties
    
    //Buttons used to choose the desired layout
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    //References LayoutView
    @IBOutlet weak var layoutView : LayoutView!
    
    @IBOutlet weak var swipe: UIButton!
    
    //Used to check which button has been pressed
    private var buttonSelect: Int = 0
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //MARK: -Actions
    
    //Layout Button 1 action
    @IBAction func didTapLayoutButton1() {
        layoutView.style = .layout1
        print("Button 1")
    }
    
    //Layout Button 2 action
    @IBAction func didTapLayoutButton2() {
        layoutView.style = .layout2
        print("Button 2")
    }
    
    //Layout Button 3 action
    @IBAction func didTapLayoutButton3() {
        layoutView.style = .layout3
        print("Button 3")
    }
    
    //Opens the gallery to choose a picture to load into the selected slot
    @IBAction func didTapLayoutImage(_ sender: UITapGestureRecognizer) {
        print("Button Pressed", sender)
        //Changes the buttonSelect value to the tag of the view that sends the tap
        buttonSelect = sender.view?.tag ?? 1
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //Enables user to swipe and share the final image, converts the view into an image
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
    
    //Applies the image to the view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("\(info)")
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage{
            
            //Checks the tag of the selected view and applies the image to it, changes the aspect of the picture to fill the view
            let selection = buttonSelect
            switch selection {
            case 1:
                layoutView.image1.image = image
                layoutView.image1.contentMode = .scaleAspectFill
            case 2:
                layoutView.image2.image = image
                layoutView.image2.contentMode = .scaleAspectFill
            case 3:
                layoutView.image3.image = image
                layoutView.image3.contentMode = .scaleAspectFill
            case 4:
                layoutView.image4.image = image
                layoutView.image4.contentMode = .scaleAspectFill
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
