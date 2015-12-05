//
//  SuggestedTagResponse.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SuggestedTagResponse {
    var responseCode: String;
    var responseDateTime: NSDate;
    var responseError: ResponseError;
    var responseData: TagResponses;
    
    init(jsonResponse: JSON) {
        self.responseCode = jsonResponse["code"].string!;
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        self.responseDateTime = formatter.dateFromString(jsonResponse["responseDateTime"].string!)!;
        self.responseError = ResponseError(jsonResponse: jsonResponse["error"]);
        self.responseData = TagResponses(jsonResponse: jsonResponse["responseTags"])
    }
}

