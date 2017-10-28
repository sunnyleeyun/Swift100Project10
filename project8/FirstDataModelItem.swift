//
//  FirstDataModelItem.swift
//  project8
//
//  Created by Mac on 2017/10/28.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import Foundation

class FirstDataModelItem{
  
  var FirstImageUrl: String?
  var FirstLabel: String?
  
  init?(data: [String: String]?) {
    if let data = data, let image = data["FirstImageUrl"], let label = data["FirstLabel"]{
      self.FirstImageUrl = image
      self.FirstLabel = label
    } else {
      return nil
    }
  }
}
