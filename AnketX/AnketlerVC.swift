//
//  AnketlerVC.swift
//  AnketX
//
//  Created by Can Ayışık on 3.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
import Parse
import Firebase

class AnketlerVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var anketListe: UITableView!
    var anketAdDizi = [String]()
    var anketIdDizi = [String]()
    var anketAdId = ""
    var soruArray = [Sorular]()
    var anketSatir : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış Yap", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cikisBtn))
        
        
        anketListe.delegate = self
        anketListe.dataSource = self
        veriTabaniCek()
        
    }
    
    func veriTabaniCek()
    {
        let dbBaglanti = Firestore.firestore()
        dbBaglanti.collection("Anketler").addSnapshotListener { (snapshot, hata) in
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
                    self.anketListe.reloadData()
                }
            }
        }
        let dbBaglanti2 = Firestore.firestore()
        dbBaglanti2.collection("Anketler").addSnapshotListener { (snapshot2, hata2) in
            if hata2 != nil
            {
                self.hata(baslikMesaj: "Bir Problem Oluştu", hataMesaj: hata2?.localizedDescription ?? "Bir hata oluştu!")
            }
            else
            {
                if snapshot2?.isEmpty != true && snapshot2 != nil
                {
                    self.soruArray.removeAll(keepingCapacity: false)
                    for sorular in snapshot2!.documents
                    {
                        if let aSiklari = sorular.get("sikADizi") as? [String]
                        {
                            if let bSiklari = sorular.get("sikBDizi") as? [String]
                            {
                                if let cSiklari = sorular.get("sikCDizi") as? [String]
                                {
                                    if let dSiklari = sorular.get("sikDDizi") as? [String]
                                    {
                                        if let sorularDizi = sorular.get("soruDizi") as? [String]
                                        {
                                            let soru = Sorular(sikADizi: aSiklari, sikBDizi: bSiklari, sikCDizi: cSiklari, sikDDizi: dSiklari, soruDizi: sorularDizi)
                                            self.soruArray.append(soru)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    @objc func cikisBtn()
    {
        do
        {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "gitGirisVC", sender: nil)
        }
        catch
        {
            print("Hata")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "gitAnketCevaplaVC"
        {
            let hedefVC = segue.destination as! AnketCevaplaVC
            hedefVC.secilenAnketId = anketAdId
            hedefVC.sikADizi = soruArray[anketSatir].sikADizi
            hedefVC.sikBDizi = soruArray[anketSatir].sikBDizi
            hedefVC.sikCDizi = soruArray[anketSatir].sikCDizi
            hedefVC.sikDDizi = soruArray[anketSatir].sikDDizi
            hedefVC.gelenSoru = soruArray[anketSatir].soruDizi
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        anketAdId = anketAdDizi[indexPath.row]
        self.anketSatir = indexPath.row
        self.performSegue(withIdentifier: "gitAnketCevaplaVC", sender: nil)
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
