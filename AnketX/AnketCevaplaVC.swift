//
//  AnketCevaplaVC.swift
//  AnketX
//
//  Created by Can Ayışık on 5.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
import Parse
import Firebase

class AnketCevaplaVC: UIViewController {
    //Soru resimleri
    @IBOutlet weak var soruView: UIImageView!
    
    //Şık butonlar
    @IBOutlet weak var sikA: UIButton!
    @IBOutlet weak var sikB: UIButton!
    @IBOutlet weak var sikC: UIButton!
    @IBOutlet weak var sikD: UIButton!
    @IBOutlet weak var soruLbl: UILabel!
    @IBOutlet weak var anketAdiLbl: UILabel!
    
    
    var secilenAnketId = ""
    var degisken = ""
    var sikADizi = [String]()
    var sikBDizi = [String]()
    var sikCDizi = [String]()
    var sikDDizi = [String]()
    var gelenSoru = [String]()
    var i : Int = 0
    var sayac : Int = 0
    var verilenCevap = [String]()
    var soruSayisi : Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //anketAdiLbl = GlobalModel.globalOge.anketAdi
        print(secilenAnketId)
        anketAdiLbl.isHidden =  true
        anketAdiLbl.text = secilenAnketId
        soruyuDegistir()
        print(i-1)

        
    }

    func anketlerSayfaDon()
    {
        self.performSegue(withIdentifier: "gitAnketCevapToNavCon", sender: nil)
        
    }
    
    @IBAction func cevapVer(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            self.sayac+=1
            let dbBaglanti = Firestore.firestore()
            
            //dbBaglanti.collection("Cevaplar").where
            
            dbBaglanti.collection("Cevaplar").whereField("anketAdi", isEqualTo: anketAdiLbl.text).getDocuments { (snapshot, hata) in
                    if hata != nil
                    {
                        self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Bir problem oluştu!")
                    }
                    else
                    {
                        if snapshot?.isEmpty == false && snapshot != nil
                        {
                            for cevaplar in snapshot!.documents
                            {
                                let cevapId = cevaplar.documentID
                                if self.sayac == 1
                                {
                                dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru1.A": FieldValue.increment(Int64(1))
                                ])
                                }
                                else if self.sayac == 2
                                {
                                dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru2.A": FieldValue.increment(Int64(1))
                                ])
                                }
                                else if self.sayac == 3
                                {
                                dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru3.A": FieldValue.increment(Int64(1))
                                ])
                                }
                                else if self.sayac == 4
                                {
                                dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru4.A": FieldValue.increment(Int64(1))
                                ])
                                }
                                else if self.sayac == 5
                                {
                                dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru5.A": FieldValue.increment(Int64(1))
                                ])
                                }
                            }
                        }
                        else
                        {
                            var dbReferans : DocumentReference? = nil
                            
                            dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).setData([
                            "Soru1": ["A": 1, "B": 0, "C": 0 , "D" : 0],
                            "Soru2": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru3": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru4": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru5": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "anketAdi" : self.anketAdiLbl.text!
                            ])
                        }
                    }
                }
            verilenCevap.append(String(sender.tag))
            soruyuDegistir()
        }
        else if sender.tag == 2
        {
            self.sayac+=1
            let dbBaglanti = Firestore.firestore()
            dbBaglanti.collection("Cevaplar").whereField("anketAdi", isEqualTo: anketAdiLbl.text).getDocuments { (snapshot, hata) in
                    if hata != nil
                    {
                        self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Bir problem oluştu!")
                    }
                    else
                    {
                        if snapshot?.isEmpty == false && snapshot != nil
                        {
                            for cevaplar in snapshot!.documents
                            {
                                let cevapId = cevaplar.documentID
                                if self.sayac == 1
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru1.B": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 2
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru2.B": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 3
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru3.B": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 4
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru4.B": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 5
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru5.B": FieldValue.increment(Int64(1))
                                    ])
                                }
                            }
                        }
                        else
                        {
                            var dbReferans : DocumentReference? = nil
                            dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).setData([
                            "Soru1": ["A": 0, "B": 1, "C": 0 , "D" : 0],
                            "Soru2": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru3": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru4": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru5": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "anketAdi" : self.anketAdiLbl.text!
                            ])
                        }
                    }
                }
            verilenCevap.append(String(sender.tag))
            soruyuDegistir()
        }
        else if sender.tag == 3
        {
            self.sayac+=1
            let dbBaglanti = Firestore.firestore()
            dbBaglanti.collection("Cevaplar").whereField("anketAdi", isEqualTo: anketAdiLbl.text).getDocuments { (snapshot, hata) in
                    if hata != nil
                    {
                        self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Bir problem oluştu!")
                    }
                    else
                    {
                        if snapshot?.isEmpty == false && snapshot != nil
                        {
                            for cevaplar in snapshot!.documents
                            {
                                let cevapId = cevaplar.documentID
                                if self.sayac == 1
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru1.C": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 2
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru2.C": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 3
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru3.C": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 4
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru4.C": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 5
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru5.C": FieldValue.increment(Int64(1))
                                    ])
                                }
                            }
                        }
                        else
                        {
                            var dbReferans : DocumentReference? = nil
                            dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).setData([
                            "Soru1": ["A": 0, "B": 0, "C": 1 , "D" : 0],
                            "Soru2": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru3": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru4": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru5": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "anketAdi" : self.anketAdiLbl.text!
                            ])
                        }
                    }
                }
            verilenCevap.append(String(sender.tag))
            soruyuDegistir()
        }
        else if sender.tag == 4
        {
            self.sayac+=1
            let dbBaglanti = Firestore.firestore()
            dbBaglanti.collection("Cevaplar").whereField("anketAdi", isEqualTo: anketAdiLbl.text).getDocuments { (snapshot, hata) in
                    if hata != nil
                    {
                        self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Bir problem oluştu!")
                    }
                    else
                    {
                        if snapshot?.isEmpty == false && snapshot != nil
                        {
                            for cevaplar in snapshot!.documents
                            {
                                let cevapId = cevaplar.documentID
                                if self.sayac == 1
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru1.D": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 2
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru2.D": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 3
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru3.D": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 4
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru4.D": FieldValue.increment(Int64(1))
                                    ])
                                }
                                else if self.sayac == 5
                                {
                                    dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).updateData([
                                    "Soru5.D": FieldValue.increment(Int64(1))
                                    ])
                                }
                            }
                        }
                        else
                        {
                            var dbReferans : DocumentReference? = nil
                            
                            //dbBaglanti.collection("Anketler").whereField
                            dbBaglanti.collection("Cevaplar").document(self.secilenAnketId).setData([
                            "Soru1": ["A": 0, "B": 0, "C": 0 , "D" : 1],
                            "Soru2": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru3": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru4": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "Soru5": ["A": 0, "B": 0, "C": 0 , "D" : 0],
                            "anketAdi" : self.anketAdiLbl.text!
                            ])
                        }
                    }
                }
            verilenCevap.append(String(sender.tag))
            soruyuDegistir()
        }
    }
    
    func bilgileriGonder()
    {
        
    }
    
    func soruyuDegistir()
    {
        if i < gelenSoru.count
        {
            soruLbl.text = gelenSoru[i]
            sikA.setTitle(sikADizi[i], for: UIControl.State.normal)
            sikB.setTitle(sikBDizi[i], for: UIControl.State.normal)
            sikC.setTitle(sikCDizi[i], for: UIControl.State.normal)
            sikD.setTitle(sikDDizi[i], for: UIControl.State.normal)
            i += 1
        }
        else
        {
            print(verilenCevap)
            self.hata(baslikMesaj: "Tebrikler!", hataMesaj: "Anketi tamamladınız. Şimdi yönlendirileceksiniz.")
            //bilgileriGonder()
            //self.verilenCevap = [""]
        }
    }
    
    func hata(baslikMesaj:String , hataMesaj:String)
    {
        let hataVer = UIAlertController(title: baslikMesaj, message: hataMesaj, preferredStyle: UIAlertController.Style.alert)
        let tamamBtn = UIAlertAction(title: "Tamam ", style: UIAlertAction.Style.default, handler: { action -> Void in
             self.performSegue(withIdentifier: "gitAnketCevapToNavCon", sender: nil)
        })
        hataVer.addAction(tamamBtn)
        self.present(hataVer, animated: true, completion: nil)
    }
}
