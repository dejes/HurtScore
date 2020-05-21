//
//  HurtDetails.swift
//  123
//
//  Created by Jack Liu on 2020/3/11.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import Foundation

struct Hurt: Codable{
    var PtNum:String?
    var ScoreAndTime = [Details?]()
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(Hurts: [Hurt]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(Hurts) {
            let url = Hurt.documentsDirectory.appendingPathComponent("Hurt").appendingPathExtension("plist")
            print(url)
            try? data.write(to: url)
        }
    }
    
    static func readHurtsFromFile() -> [Hurt]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Hurt.documentsDirectory.appendingPathComponent("Hurt").appendingPathExtension("plist")
        if let data = try? Data(contentsOf: url), let Hurts = try? propertyDecoder.decode([Hurt].self, from: data) {
            return Hurts
        } else {
            return nil
        }
    }
}

struct Details:Codable {
    var Score = -1
    var time:String?
}
var TosaveDetails:Details!
var HurtsArr = [Hurt]()
