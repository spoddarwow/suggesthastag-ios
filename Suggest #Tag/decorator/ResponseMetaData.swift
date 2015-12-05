//
//  ResponseMetaData.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ResponseMetaData {
    var appId: String;
    var requestedDateTime: NSDate;
    var processedImageURL: ProcessedImageURL
    
    init(jsonResponse: JSON) {
        self.appId = jsonResponse["appId"].string!;
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        self.requestedDateTime = formatter.dateFromString(jsonResponse["requestedDateTime"].string!)!;
        self.processedImageURL = ProcessedImageURL(jsonResponse: jsonResponse["processedImageURL"]);
    }
}

