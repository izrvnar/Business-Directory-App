//
//  ContactDetailViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-06-01.
//

import UIKit

class ContactDetailViewController: UIViewController {
    //MARK: - Properties
    var business: BusinessCD!
    var coreDataStack: CoreDataStack!

    
    
    //MARK: - Outlets
    @IBOutlet var businessNameLabel: UILabel!
    @IBOutlet var businessPhoneLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    

    //MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        if let business = business{
            businessNameLabel.text = business.businessName
            businessPhoneLabel.text = business.phoneNumber
            
        } else{
            print("error loading business ")
        }
        


    }//: View did load
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
