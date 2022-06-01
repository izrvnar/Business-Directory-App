//
//  DetailViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var business: Business?
    
    
    //MARK: - Outlets
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var salesManagerLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let business = business {
            companyNameLabel.text = business.businessName
            salesManagerLabel.text = business.salesManager
            phoneNumberLabel.text = business.phoneNumber
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
