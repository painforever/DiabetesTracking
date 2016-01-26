//
//  Constants.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/2/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import Foundation
struct SERVER {
    static let BASE_URL = "http://127.0.0.1:3001/diabetes/"
    //static let BASE_URL = "http://108.28.88.218:8080/diabetes/"
}

struct LOCAL_STORAGE{
    static var userDefaults = NSUserDefaults.standardUserDefaults()
    static let EMAIL = "email.txt"
    static let PASSWORD = "password.txt"
    static let USER_DATA = "user_data.txt"
}
