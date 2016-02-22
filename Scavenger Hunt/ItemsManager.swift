//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Lindsey Liu😉 on 16-02-19.
//  Copyright (c) 2016年 Lingzi Liu. All rights reserved.
//

import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentDirectory = directoryList.first as? String {
            return documentDirectory + "/ScavengerHuntItems"
        }
        assertionFailure("Could not determine where to store file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Failed to save to \(theArchivePath)")
            }
        }
        
    }
    
    init() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as [ScavengerHuntItem]
            }
        }
    }
}
