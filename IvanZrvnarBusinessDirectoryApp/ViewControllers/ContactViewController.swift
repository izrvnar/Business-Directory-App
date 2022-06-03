//
//  ContactViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-06-01.
//

import UIKit
import CoreData

class ContactViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    
    
    
    
    //MARK: - Properties
    var coreDataStack: CoreDataStack!
    var contactList = [BusinessCD]()
    
    func fetchBusiness(){
        let fetchRequest: NSFetchRequest<BusinessCD> = BusinessCD.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do{
            contactList = try coreDataStack.managedContext.fetch(fetchRequest)
        } catch {
            print("There was an error fetching the taskLists: \(error.localizedDescription)")

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBusiness()
        tableView.reloadData()
       
        
        let docDirect = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(docDirect
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        let listedBusiness = contactList[indexPath.row]
        
        cell.textLabel?.text = listedBusiness.businessName
        cell.detailTextLabel?.text = listedBusiness.phoneNumber
        

    
    
    return cell
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
//MARK: TableView Data Source

