//
//  TagResponse.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TagResponse {
    var tagName: String;
    var tagNameWithoutHash: String;
    var mediaCount: String;
    
    init(jsonResponse: JSON) {
        self.tagName = jsonResponse["tagName"].string!;
        self.tagNameWithoutHash = jsonResponse["tagNameWithoutHash"].string!;
        self.mediaCount = jsonResponse["mediaCount"].string!;
    }
}

