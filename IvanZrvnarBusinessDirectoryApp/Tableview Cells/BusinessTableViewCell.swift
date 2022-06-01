//
//  BusinessTableViewCell.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var salesManagerLabel: UILabel!
    @IBOutlet var carsForSaleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
