//
//  AnketAdiVC.swift
//  AnketX
//
//  Created by Can Ayışık on 12.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit

class AnketAdiVC: UIViewController {
    @IBOutlet weak var anketAdiTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri Dön", style: UIBarButtonItem.Style.plain, target: self, action: #selector(geriDon))
        
    }
    @IBAction func ileriBtn(_ sender: Any) {
        if anketAdiTxt.text! != ""
        {
        GlobalModel.globalOge.anketAdi = anketAdiTxt.text!
        self.performSegue(withIdentifier: "anketAditoAnketOlustur", sender: nil)
        }
        else
        {
            print("Bos!!!!")
        }
    }
    
    @objc func geriDon()
    {
        self.performSegue(withIdentifier: "anketAdiToAdminAna", sender: nil)
    }
    
}
