//
//  IstatistikListeVC.swift
//  AnketX
//
//  Created by Can Ayışık on 20.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
import Firebase

class IstatistikListeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cevapListe: UITableView!
    
    var anketAdDizi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cevapListe.delegate = self
        cevapListe.dataSource = self
        veritabaniCek()

    }
    
    func veritabaniCek()
    {
        let dbBaglanti = Firestore.firestore()
        dbBaglanti.collection("Cevaplar").addSnapshotListener { (snapshot, hata) in
            if hata != nil
            {
                self.hata(baslikMesaj: "Bir Problem Oluştu", hataMesaj: hata?.localizedDescription ?? "Bir hata oluştu!")
            }
            else
            {
                if snapshot?.isEmpty != true && snapshot != nil
                {
                    for anketler in snapshot!.documents
                    {
                        let anketAd = anketler.documentID
                        if let anketAdi = anketler.get("anketAdi") as? String
                        {
                            self.anketAdDizi.append(anketAdi)
                        }
                    }
                    self.cevapListe.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let satir = UITableViewCell()
        satir.textLabel?.text = anketAdDizi[indexPath.row]
        return satir
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anketAdDizi.count
    }
    
    func hata(baslikMesaj:String , hataMesaj:String)
    {
        let hataVer = UIAlertController(title: baslikMesaj, message: hataMesaj, preferredStyle: UIAlertController.Style.alert)
        let tamamBtn = UIAlertAction(title: "Tamam ", style: UIAlertAction.Style.default, handler: nil)
        hataVer.addAction(tamamBtn)
        self.present(hataVer, animated: true, completion: nil)
    }
}
