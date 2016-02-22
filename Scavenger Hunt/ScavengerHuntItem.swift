//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by Lindsey Liu😉 on 16-02-18.
//  Copyright (c) 2016年 Lingzi Liu. All rights reserved.
//

import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    let name: String
    var photo: UIImage?
    var completed: Bool {
        return photo != nil
    }
    
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name: String) {
        self.name = name
    }
}