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
    
    @IBOutlet private var gridSelector : UIImageView?
    @IBOutlet private var layoutSelected : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        image1?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        image2?.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        image3?.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        image4?.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
    
    enum Style {
        case onePlusTwo, twoPlusOne, four
    }
    
//    var style: Style = .twoPlusOne {
//        didSet {
//            setStyle(style)
//        }
//    }
    
//    private func setStyle (_ style: Style) {
//        switch style {
//        case.onePlusTwo:
//            //
//        case.twoPlusOne:
//            //
//        case.four:
//            //
//        }
//    }
}
