//
//  ICD.swift
//  ICD_Entry
//
//  Created by Anand on 12/10/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit

struct ICDMessage: Codable {
    
    let content: String?
    let body: String?
    let id: Int?
    let icd: String?
    
    private enum CodingKeys: String, CodingKey {
        case content
        case body
        case id
        case icd
    }
}
