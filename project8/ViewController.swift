//
//  ViewController.swift
//  project8
//
//  Created by Mac on 2017/10/25.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView?
  fileprivate var dataArray = [FirstDataModelItem](){
    didSet {
      tableView?.reloadData()
    }
  }
  // Note, that we do not create this data inside the ViewController
  // class: the dataArray is an empty array. We will feed it with data
  // later, using the Delegate.
  
  private let dataSource = FirstDataModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView?.register(FirstTableViewCell.nib, forCellReuseIdentifier: FirstTableViewCell.identifier)
    
    tableView?.dataSource = self
    tableView?.delegate = self
    
    dataSource.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    dataSource.requestData()
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
      cell.configureWithItem(item: dataArray[indexPath.item])
      return cell
    }
    
    return UITableViewCell()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataArray.count
  }
}

extension ViewController: FirstDataModelDelegate{
  func didFailDataUpdateWithError(error: Error) {
  }
  func didRecieveDataUpdate(data: [FirstDataModelItem]) {
    dataArray = data
  }
}



