//
//  File.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 6/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ResponseTagAlphabet {
    var tagAplhabets: [String] = [];
    
    init(jsonResponse: JSON) {
        var jsonResponseTagAlpha = [JSON]();
        if((jsonResponse != nil) && (!jsonResponse.array!.isEmpty)){
            jsonResponseTagAlpha = jsonResponse.array!;
            for tagAlphabet in jsonResponseTagAlpha {
                self.tagAplhabets.append(tagAlphabet.string!);
            }
        }
    }
}
