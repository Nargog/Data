//
//  ViewController.swift
//  NormalFördelning
//
//  Created by Mats Hammarqvist on 2018-02-24.
//  Copyright © 2018 Mats Hammarqvist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var myMeasurement = mätdata()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myMeasurement.dataSet = [1,2,3,4,5,6,7,8]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBOutlet weak var lblOutResultat: UILabel!
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        lblOutResultat.text = (" :: Sann0: \(String(describing: myMeasurement.sannolikhetNormal(sannolikhetLägreVärde: 0.95))), \(myMeasurement.factorial(Indata: 1)!) ")
        //fördelning \(fördelningsFunktion(xStop: 1))
    }
}

