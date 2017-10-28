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
  fileprivate var dataArray = [FirstDataModelItem]()
  // Note, that we do not create this data inside the ViewController
  // class: the dataArray is an empty array. We will feed it with data
  // later, using the Delegate.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView?.register(FirstTableViewCell.nib, forCellReuseIdentifier: FirstTableViewCell.identifier)
    
    //tableView.dataSource = self
    //tableView.delegate = self
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
/*
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  // MARK: <UITableView Data Source>
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
  }
  
  // MARK: <UITableView Delegate>
  
  
  
}*/



