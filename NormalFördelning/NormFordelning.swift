//
//  NormFordelning.swift
//  NormalFördelning
//
//  Created by Mats Hammarqvist on 2018-02-24.
//  Copyright © 2018 Mats Hammarqvist. All rights reserved.
//

import Foundation

class mätdata {

    var dataSet = [Double]()
    // TODO: Hantera en tom array count = 0
    
    
    
    var medel:Double {
        get{
            var tempSum = 0.0
            for index in 0..<dataSet.count {
                tempSum += dataSet[index]
            }
            if dataSet.isEmpty {
                return 0
            } else {
            return tempSum / Double(dataSet.count)
            }
        }
    }
    
    var standardavvikelse: Double? {
        get{
            if let variansenValue = variansen {
                return sqrt(variansenValue)
            } else {
                return nil
            }
        }
    }
    
    var variansen: Double? {
        get{
            var tempSum = 0.0
            for index in 0..<dataSet.count {
                tempSum += pow(medel - dataSet[index],2)
            }
            return tempSum
        }
    }

    func factorial (Indata: Int)-> Int? {
        if Indata == 0 {
            return 1
        } else  if Indata < 0 {
            return nil
        } else {
            var resultat = Indata
            if Indata > 1 {
                resultat = factorial(Indata: Indata - 1)! * Indata
            } else if Indata == 0 {
                return resultat
            }
            
            return resultat
        }
    }
    
    // Standardfel https://sv.wikipedia.org/wiki/Standardfel
    //TODO: lägg in standardfel
    
    func standardfel () -> Double? {
        
        if dataSet.isEmpty {
            return nil
        } else {
            if let variansValue = variansen {
                return sqrt(variansValue/Double(dataSet.count))
            } else {
                return nil
            }
        }
    }
    
    
// Eulers tal
    
    func EulersTal()-> Double {
        
        // Brothers' Formulae
        var sumE3: Double = 0.0

        
        for index in 0...8{
            
            
            
            
            sumE3 += (2*Double(index) + 2)/Double(factorial(Indata: 2*index + 1)!) // sum(1/n!)
            
            
        }

        return sumE3
    }
    
 // Frekvensfunktion normalfördelning
func frekvensFunktion(xBin:Double) -> Double {
    return pow(M_E, -pow(xBin, 2.0)/2.0) / sqrt(2*Double.pi)
}
 //Fördelningsfunktion normalfördelning
func fördelningsFunktion (xStop:Double) -> Double {
    
    let xStart = 0.0
    
    let xStep = 0.00001
    
    var integralSum:Double = 0
    
    for xBin in stride(from: xStart, to: abs(xStop), by: xStep){
        
        integralSum += frekvensFunktion(xBin: xBin) * xStep
        
        
    }
    
    if xStop < 0 {
    return 0.5 - integralSum
    } else {
      return 0.5 + integralSum
    }
}
// indata väntvärde och standardavvikelse samt önskad sannolikhet för lägre värde sannolikhetLägreVärde
// returenerar värde som med (sannolikhetLägreVärde) underskrids
func sannolikhetNormal (sannolikhetLägreVärde : Double) -> Double? {
    
    //let xStart = 0.0
    
    let xStep = 0.00001
    
    var xBin = 0.0
    
    var integralSum:Double = 0
    
    //Sannolikhet för att
    if sannolikhetLägreVärde < 1, sannolikhetLägreVärde > 0.5 {
    
        while integralSum < sannolikhetLägreVärde - 0.5 {
            xBin += xStep
            integralSum += frekvensFunktion(xBin: xBin) * xStep
            
            }
            if let standardValue = standardavvikelse {
            return medel + xBin * standardValue
            } else {
                return nil
            }
        } else if sannolikhetLägreVärde > 0 {
    
            while integralSum <  0.5 - sannolikhetLägreVärde {
                xBin += xStep
                integralSum += frekvensFunktion(xBin: xBin) * xStep
                
            }
        if let standardValue = standardavvikelse {
            return medel - xBin * standardValue
        } else {
            return nil
        }
        
        
            
        } else {
        
        return nil
        
        
            
        }
        
    }
}

