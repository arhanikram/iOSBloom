//
//  Garden.swift
//  Bloom
//
//  Created by Arhan Ikram on 2021-04-14.
//

import Foundation
import UIKit

class Garden: NSObject, NSCoding {
    
    var garden = [Flower]() // a collection is an array of fruits
    var current:Int = 0 // the current fruit in the collection shown in scene
    
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"

    override init(){
        super.init()
        setup()
    }

    required convenience init?(coder decoder: NSCoder) {
        self.init()
        garden = (decoder.decodeObject(forKey: collectionKey) as? [Flower])!
        current = (decoder.decodeInteger(forKey: currentKey))
        }

        func encode(with acoder: NSCoder) {
            acoder.encode(garden, forKey: collectionKey)
                acoder.encode(current, forKey: currentKey)
        }
    func currentIndex() -> Int{
        return self.current
    }

    func getCount()->Int{
        return garden.count
    }
    
    func currentFlower() ->Flower{
        return garden[self.current]
    }
    
    
    func incrementCurrent(){
        self.current += 1
        if (self.current == self.garden.count){
            self.current = 0
        }
    }
    func addFlower(flowerObj: Flower){
        garden.append(flowerObj)
    }
    
    func removeCurrentFlower(){
        if (self.current == self.garden.count - 1){
            garden.remove(at: current)
                self.current = 0
            }
        else{
            garden.remove(at: current)
            self.current -= 1
        }
    }
    
    func getCurrentIndex(with flowerNametoFind: String) {
        var curr = 0
        while curr < garden.count {
            if garden[curr].flowerName == flowerNametoFind {
                self.current = curr
                return
            }
            curr = curr + 1
        }
    }
    
    func setup(){
        self.garden.append(Flower(flowerName: "Orchid", lastWatered: "2021-04-14", lastFertilized: "2021-04-14", waterCylce: 14, fertilizerCycle: 14)!)
        
        self.garden.append(Flower(flowerName: "test", lastWatered: "2021-04-14", lastFertilized: "2021-04-14", waterCylce: 14, fertilizerCycle: 14)!)


    }
    
    func printGarden()
    {
        
        
        for (i, _) in self.garden.enumerated() {
        
        print(self.garden[i].printFlower())
        }
            
    }
        
        
}
