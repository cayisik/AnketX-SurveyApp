//
//  textSekil.swift
//  AnketX
//
//  Created by Can Ayışık on 20.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import Foundation
import UIKit

class textSekil : UITextField
{

    override init(frame: CGRect) {
        super.init(frame: frame)
        textYukle()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        textYukle()
    }
    
    
    private func textYukle() {
        tintColor             = .white
        textColor             = .darkGray
        font                  = UIFont(name: "", size: 18)
        backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        autocorrectionType    = .no
        layer.cornerRadius    = 25.0
        clipsToBounds         = true
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView              = indentView
        leftViewMode          = .always
    }
    
}
