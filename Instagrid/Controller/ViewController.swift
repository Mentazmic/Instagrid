//
//  ViewController.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    @IBOutlet weak var layoutView : layoutView!
    
    @IBOutlet weak var swipe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(layoutSelect(_:)))
        layoutView?.addGestureRecognizer(tapGesture)
        
    }
    
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

    @IBAction func layoutSelect(_ sender: UIPanGestureRecognizer) {
        
    }
    
    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        print("Swipe")
    }
}
