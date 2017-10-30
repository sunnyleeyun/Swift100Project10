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
import SwiftyJSON

protocol FirstDataModelDelegate: class {
  func didRecieveDataUpdate(data: [FirstDataModelItem])
  func didFailDataUpdateWithError(error: Error)
}

class FirstDataModel{
  // [weak var] avoid retain cycle
  weak var delegate: FirstDataModelDelegate?

  let url = "https://jsonplaceholder.typicode.com/photos?albumId=1"
  
  
  func requestData(){
    //var data: [AnyObject]? = nil

    Alamofire.request(url).validate().responseJSON { (response) in
      switch response.result.isSuccess{
      case true:
        if let data = response.result.value{
          
          let json = data as AnyObject?
          print(json)
          
          //print(data as! [AnyObject])
          self.setDataWithResponse(response: json)
          //if let number = json[]
        }
        
      case false:
        self.delegate?.didFailDataUpdateWithError(error: response.result.error!)
        //print(response.result.error)
      }
    }
  }
  
  private func setDataWithResponse(response: AnyObject?) {
    var data = [FirstDataModelItem]()
    if let responseData = response as? [[String:AnyObject]]{
      for item in responseData {
        // create FirstDataModelItem out of AnyObject
        if let firstDataModelItem = FirstDataModelItem(data: item as? [String : String]){
          data.append(firstDataModelItem)
        }
        delegate?.didRecieveDataUpdate(data: data)
      }
    }
  }
  
}
