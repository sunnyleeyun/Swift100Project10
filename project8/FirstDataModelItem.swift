//
//  FirstDataModelItem.swift
//  project8
//
//  Created by Mac on 2017/10/28.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

class FirstDataModelItem{
  
  var FirstImageUrl: String?
  var FirstLabel: String?
  
  init?(data: NSDictionary) {
    
    self.FirstImageUrl = data.value(forKey: "url") as? String
    self.FirstLabel = data.value(forKey: "title") as? String
  
  
//    if let data = data, let image = data["url"], let label = data["title"]{
//
//      self.FirstImageUrl = image
//      self.FirstLabel = label
//    } else {
//      return nil
//    }
  }
}
