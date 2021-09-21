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
    
    //Portrait Label
    @IBOutlet weak var arrowUp: UIImageView!
    @IBOutlet weak var swipeUpToShare: UILabel!
    
    //Landscape Label
    @IBOutlet weak var arrowLeft: UIImageView!
    @IBOutlet weak var swipeLeftToShare: UILabel!
    
    
    //Used to check which button has been pressed
    private var buttonSelect: Int = 0
    
    func fadeOut() {
        if UIDevice.current.orientation.isPortrait {
            swipeUpToShare.isHidden = true
            arrowUp.isHidden = true
            LayoutView.animate (withDuration: 1, animations: {
                self.layoutView.transform = CGAffineTransform(translationX: 0, y: -1200)
            }, completion: nil)
        } else if UIDevice.current.orientation.isLandscape {
            swipeLeftToShare.isHidden = true
            arrowLeft.isHidden = true
            LayoutView.animate (withDuration: 1, animations: {
                self.layoutView.transform = CGAffineTransform(translationX: -1200, y: 0)
            }, completion: nil)
        }
    }
    
    func fadeIn() {
        if UIDevice.current.orientation.isPortrait {
            swipeUpToShare.isHidden = false
            arrowUp.isHidden = false
        } else if UIDevice.current.orientation.isLandscape {
            swipeLeftToShare.isHidden = false
            arrowLeft.isHidden = false
        }
        LayoutView.animate (withDuration: 0.5, animations: {
            self.layoutView.transform = .identity
        }, completion: nil)
    }
    
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -Actions
    
    //Layout Button 1 action
    @IBAction private func didTapLayoutButton1() {
        layoutView.style = .layout1
    }
    
    //Layout Button 2 action
    @IBAction private func didTapLayoutButton2() {
        layoutView.style = .layout2
    }
    
    //Layout Button 3 action
    @IBAction private func didTapLayoutButton3() {
        layoutView.style = .layout3
    }
    
    //Opens the gallery to choose a picture to load into the selected slot
    @IBAction private func didTapLayoutImage(_ sender: UITapGestureRecognizer) {
        //Changes the buttonSelect value to the tag of the view that sends the tap
        buttonSelect = sender.view?.tag ?? 1
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //Enables user to swipe and share the final image, converts the view into an image
    @IBAction private func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            fadeOut()
            if UIDevice.current.orientation.isPortrait && sender.direction == .up || UIDevice.current.orientation.isLandscape && sender.direction == .left {
                let renderer = UIGraphicsImageRenderer(size: layoutView.bounds.size)
                let image = renderer.image { ctx in
                    layoutView.drawHierarchy(in: layoutView.bounds, afterScreenUpdates: true)
                }
                let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                vc.popoverPresentationController?.sourceView = self.view
                self.present(vc, animated: true, completion: nil)
                vc.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed:
                Bool, arrayReturnedItems: [Any]?, error: Error?) in
                    self.fadeIn()
                }
            }
        }
    }
}
//MARK: -Extension
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Applies the image to the view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
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
