//
//  AdminAnasayfaVC.swift
//  AnketX
//
//  Created by Can Ayışık on 5.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
//import Parse
import Firebase


class AdminAnasayfaVC: UIViewController {
    @IBOutlet weak var soruEkle: UIButton!
    @IBOutlet weak var istatistikGoruntule: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

}

    @IBAction func cikisBtn(_ sender: Any)
    {
        do
        {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "gitGirisToAdminAna", sender: nil)
        }
        catch
        {
            print("Hata")
        }
        

    }
    
    @IBAction func anketEkleBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "gitAnketOlusturVC", sender: nil)
    }
    
    @IBAction func istatistikBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "adminAnatoIstatistik", sender: nil)
    }
    
    
}
