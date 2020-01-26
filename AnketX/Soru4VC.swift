//
//  Soru4VC.swift
//  AnketX
//
//  Created by Can Ayışık on 10.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
import Firebase

class Soru4VC: UIViewController {
    @IBOutlet weak var anketAdiLbl: UILabel!
    @IBOutlet weak var soruDortTxt: UITextField!
    @IBOutlet weak var aSikkiTxt: UITextField!
    @IBOutlet weak var bSikkiTxt: UITextField!
    @IBOutlet weak var cSikkiTxt: UITextField!
    @IBOutlet weak var dSikkiTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anketAdiLbl.text = GlobalModel.globalOge.anketAdi

    }
    @IBAction func bitirBtn(_ sender: Any)
    {
        if soruDortTxt.text != "" && aSikkiTxt.text != "" && bSikkiTxt.text != "" && cSikkiTxt.text != "" && dSikkiTxt.text != ""
        {
            if aSikkiTxt.text != bSikkiTxt.text && aSikkiTxt.text != cSikkiTxt.text && aSikkiTxt.text != dSikkiTxt.text && bSikkiTxt.text != cSikkiTxt.text && bSikkiTxt.text != dSikkiTxt.text && cSikkiTxt.text != dSikkiTxt.text!{
            let dbBaglanti = Firestore.firestore()
            var dbReferans : DocumentReference? = nil
            let dbGonder = [ "soruDort" : soruDortTxt.text! , "soruDortiaSikki" : aSikkiTxt.text! , "soruDortbSikki" : bSikkiTxt.text! , "soruDortcSikki" : cSikkiTxt.text! , "soruDortdSikki" : dSikkiTxt.text!]
                 
        dbBaglanti.collection("Anketler").document(GlobalModel.globalOge.anketAdi).setData(dbGonder , merge: true) { (hata) in
            if hata != nil
                {
                    self.hata(baslikMesaj: "Uyarı", hataMesaj: hata?.localizedDescription ?? "Bir hata oluştu!")
                }
            }
            self.performSegue(withIdentifier: "soruDorttoAdminAna", sender: nil)
                }
                               else
                               {
                                   self.hata(baslikMesaj: "Uyari!!", hataMesaj: "Alanlar ayni olamaz!")
                               }
        }
                                else
                               {
                                   self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Alanlar boş bırakılamaz!")
                               }
    }
    @IBAction func ileriBtn(_ sender: Any)
    {
        if soruDortTxt.text != "" && aSikkiTxt.text != "" && bSikkiTxt.text != "" && cSikkiTxt.text != "" && dSikkiTxt.text != ""
        {
            if aSikkiTxt.text != bSikkiTxt.text && aSikkiTxt.text != cSikkiTxt.text && aSikkiTxt.text != dSikkiTxt.text && bSikkiTxt.text != cSikkiTxt.text && bSikkiTxt.text != dSikkiTxt.text && cSikkiTxt.text != dSikkiTxt.text!{
        let dbBaglanti = Firestore.firestore()
        dbBaglanti.collection("Anketler").whereField("anketAdi", isEqualTo: anketAdiLbl.text).getDocuments { (snapshot, hata) in
            if hata != nil
            {
                self.hata(baslikMesaj: "Uyarı", hataMesaj: hata?.localizedDescription ?? "Bir hata oluştu!")
            }
            else
            {
                if snapshot?.isEmpty == false && snapshot != nil
                {
                    for anketler in snapshot!.documents
                    {
                        let anketId = anketler.documentID
                        
                        dbBaglanti.collection("Anketler").document(self.anketAdiLbl.text!).updateData([
                        "soruSayisi": FieldValue.increment(Int64(1))])
                        
                        if var soruDizi = anketler.get("soruDizi") as? [String]
                        {
                            soruDizi.append(self.soruDortTxt.text!)
                            
                            let ustuneEkle = ["soruDizi" : soruDizi] as [String : Any]
                            dbBaglanti.collection("Anketler").document(anketId).setData(ustuneEkle, merge: true) { (hata) in
                                if hata == nil
                                {
                                    self.performSegue(withIdentifier: "soruDorttoSoruBes", sender: nil)
                                }
                            }
                        }
                        if var sikADizi = anketler.get("sikADizi") as? [String]
                        {
                                sikADizi.append(self.aSikkiTxt.text!)
                                let ustuneEkle2 = ["sikADizi" : sikADizi] as [String : Any]
                                dbBaglanti.collection("Anketler").document(anketId).setData(ustuneEkle2, merge: true) { (hata) in
                                        if hata == nil
                                        {
                                            self.performSegue(withIdentifier: "soruDorttoSoruBes", sender: nil)
                                        }
                                }
                        }
                        if var sikBDizi = anketler.get("sikBDizi") as? [String]
                        {
                            sikBDizi.append(self.bSikkiTxt.text!)
                            let ustuneEkle3 = ["sikBDizi" : sikBDizi] as [String : Any]
                            dbBaglanti.collection("Anketler").document(anketId).setData(ustuneEkle3, merge: true) { (hata) in
                                if hata == nil
                                {
                                    self.performSegue(withIdentifier: "soruDorttoSoruBes", sender: nil)
                                }
                            }
                        }
                        if var sikCDizi = anketler.get("sikCDizi") as? [String]
                        {
                            sikCDizi.append(self.cSikkiTxt.text!)
                            let ustuneEkle4 = ["sikCDizi" : sikCDizi] as [String : Any]
                            dbBaglanti.collection("Anketler").document(anketId).setData(ustuneEkle4, merge: true) { (hata) in
                                if hata == nil
                                {
                                    self.performSegue(withIdentifier: "soruDorttoSoruBes", sender: nil)
                                }
                            }
                        }
                        if var sikDDizi = anketler.get("sikDDizi") as? [String]
                        {
                            sikDDizi.append(self.dSikkiTxt.text!)
                            let ustuneEkle5 = ["sikDDizi" : sikDDizi] as [String : Any]
                            dbBaglanti.collection("Anketler").document(anketId).setData(ustuneEkle5, merge: true) { (hata) in
                                if hata == nil
                                {
                                    self.performSegue(withIdentifier: "soruDorttoSoruBes", sender: nil)
                                }
                            }
                        }
                    }
                }
                else
                {
                    var dbReferans : DocumentReference? = nil
                    let dbGonder = ["anketAdi" : self.anketAdiLbl.text! , "soruDizi" : [self.soruDortTxt.text!] , "sikADizi" : [self.aSikkiTxt.text!], "sikBDizi" : [self.bSikkiTxt.text!], "sikCDizi" : [self.cSikkiTxt.text!] , "sikDDizi" : [self.dSikkiTxt.text!]] as! [String:Any]
                    
                    dbBaglanti.collection("Anketler").document(GlobalModel.globalOge.anketAdi).setData(dbGonder) { (hata) in
                        if hata != nil
                        {
                            self.hata(baslikMesaj: "Uyarı", hataMesaj: hata?.localizedDescription ?? "Bir hata oluştu!")
                        }
                    }
                    self.performSegue(withIdentifier: "soruBirtoSoruIki", sender: nil)
                }
            }
        }
                }
                    else
                    {
                        self.hata(baslikMesaj: "Uyari!!", hataMesaj: "Alanlar ayni olamaz!")
                    }
                }
                    else
                    {
                        self.hata(baslikMesaj: "Uyarı!", hataMesaj: "Alanlar boş bırakılamaz!")
                    }

    }
    
    func hata(baslikMesaj:String , hataMesaj:String)
    {
        let hataVer = UIAlertController(title: baslikMesaj, message: hataMesaj, preferredStyle: UIAlertController.Style.alert)
        let tamamBtn = UIAlertAction(title: "Tamam ", style: UIAlertAction.Style.default, handler: nil)
        hataVer.addAction(tamamBtn)
        self.present(hataVer, animated: true, completion: nil)
    }
}
