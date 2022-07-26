//
//  DetailViewController.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: - Properties
    var business: Business?
    var coreDataStack: CoreDataStack!
    @IBOutlet var mapView: MKMapView!
    
    // saving the business to the core data stack
    @IBAction func saveContact(_ sender: Any) {
        let savedBusiness = BusinessCD(context: coreDataStack.managedContext)
        savedBusiness.businessName = business?.businessName
        savedBusiness.salesManager = business?.salesManager
        savedBusiness.phoneNumber = business?.phoneNumber
        savedBusiness.id = Int16(Int(business!.id))
        savedBusiness.companyLogo = business?.companyLogo
        coreDataStack.saveContext()
        
        // print test
        print(savedBusiness)
        
        // adding the alert that the business has been saved
        let savedConfirmation = SavedConfirmation()
        savedConfirmation.frame = view.bounds
        savedConfirmation.isOpaque = false
        
        view.addSubview(savedConfirmation)
        view.isUserInteractionEnabled = false
        savedConfirmation.showDialog()
        
        let delay = 1.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    
    
    
    
    
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
            
            // printing long/latitude
            print("\(business.longitude) \(business.latitude)")
            //checking for correct car 
            for car in business.vehicles {
                print(car.make)
            }
            
            
            // setting the map location to the business 
            
            let buisnessLocation = CLLocation(latitude: business.latitude, longitude: business.longitude)
            let regionRadius : CLLocationDistance = 1_000
            
            let region = MKCoordinateRegion(center: buisnessLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            mapView.setRegion(region, animated: true)
            let mapAnnotationView = CustomPin(coordinate: (CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)), title:"\(business.vehicles.count) Cars")
            mapView.addAnnotation(mapAnnotationView)
            mapView.isRotateEnabled = false
            mapView.isScrollEnabled = false
            

        }
        
        mapView.delegate = self
     
        

        // Do any additional setup after loading the view.
    }
    //MARK: - Methods
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


