//
//  Breed.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import Foundation

struct Breed: Identifiable, Decodable {
    let id = UUID()
    
    let name: String
    let description: String?
    let referenceImageID: String?
    let dogFriendly: Int?
    
    var imageURL: URL? {
        guard let referenceImageID = referenceImageID else {
            return nil
        }
        
        if dogFriendly != nil {
            return URL(string: "https://cdn2.thecatapi.com/images/\(referenceImageID).jpg")
        } else {
            return URL(string: "https://cdn2.thedogapi.com/images/\(referenceImageID).jpg")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name, description, referenceImageID = "reference_image_id", dogFriendly = "dog_friendly"
    }
}
