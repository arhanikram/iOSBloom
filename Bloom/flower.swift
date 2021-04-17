//
//  flower.swift
//  Bloom
//
//  Created by Arhan Ikram on 2021-04-14.
//

import Foundation
import UIKit
import os.log

class Flower: NSObject, NSCoding {
   let flowerName : String
   let lastWatered : String
   let lastFertilized : String

   let waterCycle : Int
   let fertilizerCycle : Int


   struct PropertyKey {
    
    static let flowerName = "flowerName"
    static let lastWatered = "lastWatered"
    static let lastFertilized = "lastFertalized"
    static let waterCycle = "waterCycle"
    static let fertilizerCycle = "fertalizerCycle"
    }
   
    func encode(with aCoder: NSCoder) {
    aCoder.encode(flowerName, forKey: PropertyKey.flowerName)
    aCoder.encode(lastWatered, forKey: PropertyKey.lastWatered)
    aCoder.encode(lastFertilized, forKey: PropertyKey.lastFertilized)
    aCoder.encode(waterCycle, forKey: PropertyKey.waterCycle)
    aCoder.encode(fertilizerCycle, forKey: PropertyKey.fertilizerCycle)
    }
   
   required convenience init?(coder aDecoder: NSCoder) {

    // The name is required. If we cannot decode a name string, the initializer should fail.

   /*guard let lastWatered = aDecoder.decodeObject(
           forKey: PropertyKey.lastWatered) as? String else {
       os_log("Unable to decode lastWatered.",
              log: OSLog.default, type: .debug)
       return nil
    }*/
     // Because photo is an optional property of Meal, just use conditional cast.*/
    
    let flowerNameDecoded = (aDecoder.decodeObject(forKey: PropertyKey.flowerName) as? String)!
    let lastWateredDecoded = (aDecoder.decodeObject(forKey: PropertyKey.lastWatered) as? String)!
    let lastFertalizedDecoded = (aDecoder.decodeObject(forKey: PropertyKey.lastFertilized) as? String)!
    let waterCycleDecoded = aDecoder.decodeInteger(forKey: PropertyKey.waterCycle) as Int
    let fertilizerCycleDecoded = aDecoder.decodeInteger(forKey: PropertyKey.fertilizerCycle) as Int
    // Must call designated initializer.
 
    self.init(flowerName: flowerNameDecoded, lastWatered: lastWateredDecoded, lastFertilized: lastFertalizedDecoded , waterCylce: waterCycleDecoded , fertilizerCycle: fertilizerCycleDecoded)
    }
    init?(flowerName: String, lastWatered: String, lastFertilized: String, waterCylce: Int, fertilizerCycle: Int) {
        self.flowerName = flowerName
        self.lastWatered = lastWatered
        self.lastFertilized = lastFertilized
        self.waterCycle = waterCylce
        self.fertilizerCycle = fertilizerCycle
    }
    
    
    func getName()->String{
        return self.flowerName
    }
    
    func getWatered()->String{
        return self.lastWatered
    }
    
    func getFertilized()->String{
        return self.lastFertilized
    }
    
    func getWaterCycle()->Int{
        return self.waterCycle
    }
    
    func getFertilizerCycle()->Int{
        return self.fertilizerCycle
    }
    
    func printFlower()->String
    {
        /*print(self.flowerName)
        print(self.lastWatered)
       
        
        print(self.lastFertilized)
        print(self.waterCycle)
        print(self.fertilizerCycle)*/
        
        var formattedFlower: String
        
        formattedFlower = String(self.flowerName) + "\nLast Watered: " + String(self.lastWatered) + " \nLast Fertilized: " + String(self.lastFertilized) + "\nWater Cycle: " + String(self.waterCycle) + "\nFertilizer Cycle: " + String(self.fertilizerCycle)
        
        return formattedFlower
    }
}
