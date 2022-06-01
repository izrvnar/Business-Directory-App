//
//  Business.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-05-31.
//

import Foundation

struct Businesses: Codable{
    var downloadedResults: [Business]
}

enum Section{
    case main
}

class Business: Codable, Hashable{
    static func == (lhs: Business, rhs: Business) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int
    var businessName: String
    var salesManager: String
    var phoneNumber: String
    var latitude: Double
    var longitude : Double
    var vehicles: [Vehicles]
    
    
    init(id: Int, businessName: String, salesManager: String, phoneNumber: String, latitude: Double, longitude: Double, vehicles: Vehicles){
        self.id = id
        self.businessName = businessName
        self.salesManager = salesManager
        self.phoneNumber = phoneNumber
        self.latitude = latitude
        self.longitude = longitude
        self.vehicles = [vehicles]
        
        
    }
    
    
    
    
    
    
    
    
    
}
