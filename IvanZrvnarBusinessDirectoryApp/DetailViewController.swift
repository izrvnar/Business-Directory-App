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
    @IBOutlet var mapView: MKMapView!
    
    
    
    
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
            
            
            
            let buisnessLocation = CLLocation(latitude: business.latitude, longitude: business.longitude)
            let regionRadius : CLLocationDistance = 1_000
            
            let region = MKCoordinateRegion(center: buisnessLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            mapView.setRegion(region, animated: true)
            let mapAnnotationView = CustomPin(coordinate: (CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)))
            mapView.addAnnotation(mapAnnotationView)
            

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

