//
//  ProcessedImageURL.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProcessedImageURL {
    var thumbnailUrl: String;
    var actualUrl: String;
    var largeUrl: String;
    
    
    init(jsonResponse: JSON) {
        self.thumbnailUrl = jsonResponse["thumbnail"].string!;
        self.actualUrl = jsonResponse["actual"].string!;
        self.largeUrl = jsonResponse["large"].string!;
    }
}

