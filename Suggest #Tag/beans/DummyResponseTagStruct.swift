//
//  ResponseTagStruct.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 1/11/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import SwiftyJSON

class DummyResponseTagStruct {
    var name: String
    
    init(name: String){
        self.name = name;
    }
    
    func getDummyJsonResponse() -> JSON {
        let path = NSBundle.mainBundle().pathForResource(self.name, ofType: "json")
        let data : NSData = try! NSData(contentsOfFile: path! as String, options: NSDataReadingOptions.DataReadingMapped)
        print(data)
        let jsonData = JSON(data: data)
        print(jsonData)
        return jsonData;
    }
}


