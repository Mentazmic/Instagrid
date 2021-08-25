//
//  LayoutView.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 18/08/2021.
//

import UIKit

class layoutView: UIView {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var selectedLayout1: UIImageView!
    @IBOutlet weak var selectedLayout2: UIImageView!
    @IBOutlet weak var selectedLayout3: UIImageView!
    
    enum Style {
        case layout1, layout2, layout3
    }
    
    var style: Style = .layout3{
        //Appelle la fonction setStyle lorsque la propriété style est modifiée
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle (_ style: Style) {
        switch style {
        case.layout1:
            image1.image = #imageLiteral(resourceName: "Plus")
            image2.image = #imageLiteral(resourceName: "Plus")
            image3.image = #imageLiteral(resourceName: "Plus")
            image4.image = #imageLiteral(resourceName: "Plus")
            image1.isHidden = false
            image2.isHidden = true
            image3.isHidden = false
            image4.isHidden = false
            selectedLayout1.isHidden = false
            selectedLayout2.isHidden = true
            selectedLayout3.isHidden = true
        case.layout2:
            image1.image = #imageLiteral(resourceName: "Plus")
            image2.image = #imageLiteral(resourceName: "Plus")
            image3.image = #imageLiteral(resourceName: "Plus")
            image4.image = #imageLiteral(resourceName: "Plus")
            image1.isHidden = false
            image2.isHidden = false
            image3.isHidden = false
            image4.isHidden = true
            selectedLayout1.isHidden = true
            selectedLayout2.isHidden = false
            selectedLayout3.isHidden = true
        case.layout3:
            image1.image = #imageLiteral(resourceName: "Plus")
            image2.image = #imageLiteral(resourceName: "Plus")
            image3.image = #imageLiteral(resourceName: "Plus")
            image4.image = #imageLiteral(resourceName: "Plus")
            image1.isHidden = false
            image2.isHidden = false
            image3.isHidden = false
            image4.isHidden = false
            selectedLayout1.isHidden = true
            selectedLayout2.isHidden = true
            selectedLayout3.isHidden = false
        }
    }
    
}
