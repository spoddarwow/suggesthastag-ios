//
//  TagResponseDictionary.swift
//  Suggest #Tag
//
//  Created by Sumit Poddar on 6/12/2015.
//  Copyright © 2015 Sumit Poddar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct  TagResponseDictionary {
    var tagResponseMap : [String : TagResponses]
    var tagsList: [TagResponse] = [];
    
    init (jsonResponse: JSON) {
        let tagDictionaries = jsonResponse.array;
        tagResponseMap = [String : TagResponses]();
        if(tagDictionaries != nil){
            for tag in tagDictionaries! {
                var tagDictionary = tag.dictionary;
                for (key,value) in tagDictionary! {
                    var tagResponseObject = TagResponses(jsonResponse: value);
                    self.tagResponseMap[key] = tagResponseObject;
                    for tagResp in tagResponseObject.tagResponses {
                        self.tagsList.append(tagResp);
                    }
                }
                
            }
        }
        
    }
    
}
