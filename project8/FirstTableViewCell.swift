//
//  FirstTableViewCell.swift
//  project8
//
//  Created by Mac on 2017/10/28.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var firstImageView: UIImageView?
  @IBOutlet weak var firstLabel: UILabel?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureWithItem(item: FirstDataModelItem){
    firstImageView?.downloadedFrom(link: item.FirstImageUrl!)
    firstLabel?.text = item.FirstLabel
  }
  
}
