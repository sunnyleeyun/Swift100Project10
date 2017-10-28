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
protocol FirstDataModelDelegate: class {
  func didRecieveDataUpdate(data: [FirstDataModelItem])
  func didFailDataUpdateWithError(error: Error)
}

class FirstDataModel{
  // [weak var] avoid retain cycle
  weak var delegate: FirstDataModelDelegate?

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
        self.delegate?.didFailDataUpdateWithError(error: response.result.error!)
        //print(response.result.error)
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
      delegate?.didRecieveDataUpdate(data: data)
    }
  }
  
}
