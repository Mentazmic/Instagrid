//
//  GridView.swift
//  Instagrid
//
//  Created by Maxime Landu-Wa on 01/08/2021.
//

import UIKit

class GridView : UIViewController {
    @IBOutlet private var image1 : UIImageView?
    @IBOutlet private var image2 : UIImageView?
    @IBOutlet private var image3 : UIImageView?
    @IBOutlet private var image4 : UIImageView?
    
    @IBOutlet private var layoutSelector1 : UIImageView?
    @IBOutlet private var layoutSelector2 : UIImageView?
    @IBOutlet private var layoutSelector3 : UIImageView?
    
    @IBOutlet private var gridSelector : UIImageView?
    @IBOutlet private var layoutSelected : UIImageView?
    
    
    enum Style {
        case layout1, layout2, layout3
    }
    
    var style: Style = .layout3 {
        //Appelle la fonction setStyle lorsque la propriété style est modifiée
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle (_ style: Style) {
        switch style {
        case.layout1:
            image2?.isHidden = true
            layoutSelector1?.isHidden = true
            layoutSelector2?.isHidden = true
            layoutSelector3?.isHidden = true
        case.layout2:
            image4?.isHidden = true
            layoutSelector1?.isHidden = true
            layoutSelector2?.isHidden = true
            layoutSelector3?.isHidden = true
        case.layout3:
            
            layoutSelector1?.isHidden = true
            layoutSelector2?.isHidden = true
            layoutSelector3?.isHidden = true
        }
    }
}
