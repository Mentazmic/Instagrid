//
//  LayoutView.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 18/08/2021.
//

import UIKit

//LayoutView class, contains the 3 or 4 imges of the grid
class LayoutView: UIView {
    //MARK: -Properties
    
    //ImageView outlets for each image of the LayoutView
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    //ImageView outlets for each image of the layout selection
    @IBOutlet weak var selectedLayout1: UIImageView!
    @IBOutlet weak var selectedLayout2: UIImageView!
    @IBOutlet weak var selectedLayout3: UIImageView!
    
    //MARK: -Style
    
    //Enumerates the three possible layouts
    enum Style {
        case layout1, layout2, layout3
    }
    
    //Calls setStyle when the attribute style is modified
    var style: Style = .layout3{
        didSet {
            setStyle(style)
        }
    }
    
    //Switch containing every layout options, shows or hides the views needed
    private func setStyle (_ style: Style) {
        switch style {
        case.layout1:
            image1.isHidden = false
            image2.isHidden = true
            image3.isHidden = false
            image4.isHidden = false
            selectedLayout1.isHidden = false
            selectedLayout2.isHidden = true
            selectedLayout3.isHidden = true
        case.layout2:
            image1.isHidden = false
            image2.isHidden = false
            image3.isHidden = false
            image4.isHidden = true
            selectedLayout1.isHidden = true
            selectedLayout2.isHidden = false
            selectedLayout3.isHidden = true
        case.layout3:
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
