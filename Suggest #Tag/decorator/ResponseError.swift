//
//  ResponseError.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ResponseError {
    
    var errorCode: String;
    var errorMessage: String;
    
    init(jsonResponse: JSON){
        if(jsonResponse != nil){
            self.errorCode = jsonResponse["code"].string!;
            self.errorMessage = jsonResponse["message"].string!;
        }else{
            self.errorCode = "0";
            self.errorMessage = "";
        }
    }
}

