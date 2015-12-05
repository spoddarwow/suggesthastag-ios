//
//  DecorateJsonTagResponse.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 1/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import UIKit
import SwiftyJSON

class DecorateHashTagResponse {
    var jsonResponse: JSON
    var responseMetaData: ResponseMetaData
    var response: SuggestedTagResponse
    
    init(jsonResponse: JSON) {
        self.jsonResponse = jsonResponse;
        self.responseMetaData = ResponseMetaData(jsonResponse: self.jsonResponse["metadata"]);
        self.response = SuggestedTagResponse(jsonResponse: self.jsonResponse["response"]);
    }
}
