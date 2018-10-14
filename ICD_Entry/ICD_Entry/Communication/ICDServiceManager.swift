//
//  ICDServiceManager.swift
//  ICD_Entry
//
//  Created by Anand on 12/10/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit

class ICDServiceManager: NSObject {

    func getIDCMessages(completionHandler: @escaping ([ICDMessage], URLResponse?, String?) -> Swift.Void) {
        let url = URL(string: "https://plrfa9f34f.execute-api.us-east-1.amazonaws.com/FetchICD?sid=817282")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else {
                completionHandler([], nil, "Invalid Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode([ICDMessage].self, from: data)
                completionHandler(gitData, response, error?.localizedDescription)
            } catch let err {
                completionHandler([], nil, err.localizedDescription)
                print("Err", err)
            }
        }
        
        task.resume()
    }
}
