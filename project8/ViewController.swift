//
//  ViewController.swift
//  project8
//
//  Created by Mac on 2017/10/25.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView?
  
  var profileCells = [FirstDataModelItem]()
  
  // Note, that we do not create this data inside the ViewController
  // class: the dataArray is an empty array. We will feed it with data
  // later, using the Delegate.
  
  let url = "https://jsonplaceholder.typicode.com/photos?albumId=1"

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView?.register(FirstTableViewCell.nib, forCellReuseIdentifier: FirstTableViewCell.identifier)
    
    tableView?.dataSource = self
    tableView?.delegate = self
    
    
    Alamofire.request(url).validate().responseJSON { (response) in
      switch response.result.isSuccess{
      case true:
        if let data = response.result.value{
          
          let jsonB = JSON(data)
          print(jsonB)
          
          for json in jsonB[].arrayValue {
            // make a viewcellmodel object
            let profileCell = FirstDataModelItem(data: json)
            self.profileCells.append(profileCell!)
          }
          self.tableView?.reloadData()
          
        }
        
      case false:
        print(response.result.error)
      }
    }
    
  }
  
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UITableViewDelegate{
  // All methods in UITableViewDelegate are optional

}

extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell
    {
      cell.configureWithItem(item: profileCells[indexPath.item])
      return cell
    }
    
    return UITableViewCell()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return profileCells.count
  }
}





