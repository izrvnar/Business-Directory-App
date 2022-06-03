//
//  ViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import UIKit

class ViewController: UIViewController {
    // reference to the core data stack
    var coreDataStack: CoreDataStack!
    
    var businesses = [Business]()
    //MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    
    private lazy var tableDataSource = UITableViewDiffableDataSource<Section, Business>(tableView: tableView){
        tableView, indexPath, business in
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BusinessTableViewCell
        cell.companyNameLabel.text = business.businessName
        cell.salesManagerLabel.text = business.salesManager
        cell.carsForSaleLabel.text = "\(business.vehicles.count) cars for sale"
        
        
        return cell
    }
    //MARK: - Data Snapshot
    func createDataSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Business>()
        snapshot.appendSections([.main])
        snapshot.appendItems(businesses, toSection: .main)
        tableDataSource.apply(snapshot)
    }
    
   
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchBusiness()
    }
    
        //MARK:  - Fetch Businesses
    func fetchBusiness(){
        let urlString = "https://dtakaki.scweb.ca/MADTutorial/test1Download.json"
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error {
                print("Could not fetch the data - \(error.localizedDescription)")
            } else {
                do{
                    guard let data = data else { return }
                    
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Businesses.self, from: data)
                    print("Results = \(results.downloadedResults.count)")
                    self.businesses = results.downloadedResults
                } catch DecodingError.keyNotFound(let key, let context){
                    print("\(key) not found - Problem with the key - \(context)")
                } catch DecodingError.valueNotFound(let value, let context){
                    print("\(value) not found - Problem with no value - \(context)")
                } catch {
                    print("Error trying to decode - \(error.localizedDescription)")
                }
            }
            
            DispatchQueue.main.async {
                self.createDataSnapShot()
            }
        }
        
        dataTask.resume()
        }
    
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = tableView.indexPathForSelectedRow else {return}
        
        let destinationVC = segue.destination as! DetailViewController
        
        let businessToPass = tableDataSource.itemIdentifier(for: selectedIndex)
        destinationVC.business = businessToPass
        destinationVC.coreDataStack = coreDataStack
        
        
        

    }
    
    
    }//: view controller




