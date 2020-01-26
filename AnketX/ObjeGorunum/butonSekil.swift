//
//  butonSekil.swift
//  AnketX
//
//  Created by Can Ayışık on 20.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import Foundation
import UIKit

class butonSekil : UIButton
{
    override init (frame : CGRect)
    {
        super.init(frame : frame)
        butonYukle()
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
        butonYukle()
    }
    
    private func butonYukle()
    {
        backgroundColor = UIColor.brown
        titleLabel?.font = UIFont(name: "", size: 22)
        layer.cornerRadius = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
