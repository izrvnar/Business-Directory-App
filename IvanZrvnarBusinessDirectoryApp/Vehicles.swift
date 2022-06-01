//
//  Vehicles.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-06-01.
//

import Foundation

class Vehicles: Codable, Hashable{
    
    static func == (lhs: Vehicles, rhs: Vehicles) -> Bool {
        lhs.vin == rhs.vin
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(vin)
    }
    
    var make: String
    var model: String
    var year: Int
    var vin: String
    var color: String
    var price: Double
    
    init(make: String, model: String, year: Int, vin: String, color: String, price: Double){
        self.make = make
        self.model = model
        self.year = year
        self.vin = vin
        self.color = color
        self.price = price
        
    }
    
    
}
