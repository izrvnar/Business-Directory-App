//
//  ContactDetailViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-06-01.
//

import UIKit

class ContactDetailViewController: UIViewController, UNUserNotificationCenterDelegate {
    //MARK: - Properties
    var business: BusinessCD!
    var coreDataStack: CoreDataStack!

    
    
    //MARK: - Outlets
    @IBOutlet var businessNameLabel: UILabel!
    @IBOutlet var businessPhoneLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    // setting the notifiction to call about the cars in stock
    @IBAction func setNotification(_ sender: Any) {
       

        let content = UNMutableNotificationContent()
        content.title = "Reminder to call \(business.businessName ?? "business")"
        content.body = "Ask \(business.salesManager ?? "Jim") about the cars they have in stock"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.timer.\(UUID().uuidString)", content: content, trigger: trigger)
       
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
            error in
            
            if let error = error {
                print("Error adding a timer notification - \(error.localizedDescription)")
            }
        })
        
 
    }
    
    

    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        if let business = business{
            businessNameLabel.text = business.businessName
            businessPhoneLabel.text = business.phoneNumber
            
        } else{
            print("error loading business ")
        }
        
        // requesting premisson for notifications
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge,.sound], completionHandler: {
            granted, error in
            
            if granted {
                print("Access has been granted")
            } else {
                print("Access has not been granted")
            }
        })

       

        


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
