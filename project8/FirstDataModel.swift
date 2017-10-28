//
//  FirstDataModel.swift
//  project8
//
//  Created by Mac on 2017/10/29.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class FirstDataModel{
  let url = "https://jsonplaceholder.typicode.com/photos"
  
  func requestData(){
    Alamofire.request(url).validate().responseJSON { (response) in
      switch response.result.isSuccess{
      case true:
        if let value = response.result.value{
          //let json = JSON(value)
          //if let number = json[]
        }
        
      case false:
        print(response.result.error)
      }
    }
  }
  
  private func setDataWithResponse(response: [AnyObject]) {
    var data = [FirstDataModelItem]()
    for item in response {
      // create DRHTableViewDataModelItem out of AnyObject
      if let firstDataModelItem = FirstDataModelItem(data: item as? [String: String]){
        data.append(firstDataModelItem)
      }
      
    }
  }
  
}
