//
//  TagResponses.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 4/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TagResponses {
    var tagResponses: [TagResponse] = [];
    
    init(jsonResponse: JSON) {
        let tags: [JSON];
        if(jsonResponse != nil && !jsonResponse.array!.isEmpty){
            tags = jsonResponse.array!;
            for tag in tags {
                self.tagResponses.append(TagResponse(jsonResponse: tag));
            }
        }
    }
}

