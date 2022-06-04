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
    var business = BusinessCD()

    

    
    //MARK: - Diffable Data Source
    private lazy var tableDataSource = UITableViewDiffableDataSource<Section, BusinessCD>(tableView: tableView){
        tableView, indexPath, business in
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let listedBusiness = self.contactList[indexPath.row]

        cell.textLabel?.text = listedBusiness.businessName
        cell.detailTextLabel?.text = listedBusiness.phoneNumber
        
        if let companylogo = business.companyLogo{
            self.fetchImage(for: companylogo, in: cell)
        } else {
            cell.imageView?.image = UIImage(systemName: "car.circle.fill")
        }
        
        
        return cell
    }
    
    func createDataSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, BusinessCD>()
        snapshot.appendSections([.main])
        snapshot.appendItems(contactList, toSection: .main)
        tableDataSource.apply(snapshot)
    }

    


    
    
    
    func fetchBusiness(){
        let fetchRequest = BusinessCD.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do{
            contactList = try coreDataStack.managedContext.fetch(fetchRequest)
        } catch {
            print("There was an error fetching the taskLists: \(error.localizedDescription)")

        }
        DispatchQueue.main.async {
            self.createDataSnapShot()
        }
        
    }
    
    func fetchImage(for path: String, in cell: UITableViewCell){
        let businessPath = path
        
        guard let imageUrl = URL(string: businessPath) else {
            return
        }
        
        let imageFetchTask = URLSession.shared.downloadTask(with: imageUrl){
            url, response, error in
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                }
            }
        }
        imageFetchTask.resume()
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self

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


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let selectedIndex = tableView.indexPathForSelectedRow else {return}
        let destinationVC = segue.destination as! ContactDetailViewController
        let businessToPass = tableDataSource.itemIdentifier(for: selectedIndex)
        destinationVC.business = businessToPass
        destinationVC.coreDataStack = coreDataStack


       

        

    }
    

}
//MARK: - TableView Data Source

extension ContactViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = UIContextualAction(style: .destructive, title: "Remove"){(_,_, completionHandler) in
            self.contactList.remove(at: indexPath.row)

            completionHandler(true)
            self.coreDataStack.saveContext()

        }
        deleteItem.image = UIImage(systemName: "scissors")
        deleteItem.backgroundColor = UIColor(named: "red")

        let config = UISwipeActionsConfiguration(actions: [deleteItem])
        return config
    }


    

}

    


