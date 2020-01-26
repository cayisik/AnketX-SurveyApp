//
//  IstatistikVC.swift
//  AnketX
//
//  Created by Can Ayışık on 19.01.2020.
//  Copyright © 2020 Can Ayışık. All rights reserved.
//

import UIKit
import AnyChartiOS
import Firebase
class IstatistikVC: UIViewController {
    @IBOutlet var anyChartView: AnyChartView!
    
    let dbBaglanti = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri Dön", style: UIBarButtonItem.Style.plain, target: self, action: #selector(geriDon))
        //let ref = dbBaglanti.collection("Cevaplar")
        //var deger = ref.document("Deneme7").index(ofAccessibilityElement: "Soru2")
        
        
        //print("Deger: " + String(deger))
        let chart = AnyChart.bar()
        let data : Array<DataEntry> =
            [
                ValueDataEntry(x: "Elma" , value: 1),
                ValueDataEntry(x: "Armut" , value: 2),
                ValueDataEntry(x: "Karpuz" , value: 3),
                ValueDataEntry(x: "Kavun" , value: 4),
                ValueDataEntry(x: "Çilek" , value: 5)
            ]
        chart.data(data: data)
        chart.title(settings: "En Çok Tüketilen Meyveler:")
        anyChartView.setChart(chart: chart)

    }
    
    @objc func geriDon()
    {
        self.performSegue(withIdentifier: "istatistikToAdminAna", sender: nil)
    }
}
