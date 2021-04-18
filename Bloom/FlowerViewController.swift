//
//  SharedFruitCollection.swift
//  chux9490_a1
//
//  Created by Julian on 2020-02-29.
//  Copyright © 2020 CP469. All rights reserved.
//

import Foundation

class SharingGarden {
    static let sharedGarden = SharingGarden()
    
    let fileName = "plants.archive"
    private let rootKey = "rootKey"
    var newGarden: Garden?
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent(fileName) as String
    }
    
    func loadGarden(){
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) {
            let data = NSMutableData(contentsOfFile: filePath)!
            if (filePath != "") {
                let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data as Data)
                SharingGarden.sharedGarden.newGarden = (unarchiver.decodeObject(forKey: rootKey) as? Garden)! as Garden
                unarchiver.finishDecoding()
            }
        }
    }
    
    func saveGarden() {
        let filePath = self.dataFilePath()
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        archiver.encode(SharingGarden.sharedGarden.newGarden, forKey: rootKey)
        archiver.finishEncoding()
        data.write(toFile: filePath, atomically: true)
    }
}
