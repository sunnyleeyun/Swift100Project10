//
//  FirstDataModelItem.swift
//  project8
//
//  Created by Mac on 2017/10/28.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class FirstDataModelItem: NSObject{
  
  var FirstImageUrl: String?
  var FirstLabel: String?
  
  init?(data: JSON) {
    
    self.FirstImageUrl = data["url"].string
    self.FirstLabel = data["title"].string

    
  }
  
  
  
  
  
  
}
