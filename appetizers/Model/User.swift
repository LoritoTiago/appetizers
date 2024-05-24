//
//  User.swift
//  appetizers
//
//  Created by Lorito Mbuta on 24/05/2024.
//

import Foundation


struct User: Codable{
    var firstName: String = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapKins = false
    var frequentRefills = false
    
    
}
