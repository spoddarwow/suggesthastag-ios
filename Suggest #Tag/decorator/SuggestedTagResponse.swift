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
    
    var responseTagCount: String!;
    var responseTagAlphabet: ResponseTagAlphabet!;
    var responseData: TagResponseDictionary;
    
    init(jsonResponse: JSON) {
        self.responseTagCount = jsonResponse["count"].string!;
        self.responseTagAlphabet = ResponseTagAlphabet(jsonResponse: jsonResponse["tagAlpahbets"])
        self.responseData = TagResponseDictionary(jsonResponse: jsonResponse["responseTags"])
    }
}

