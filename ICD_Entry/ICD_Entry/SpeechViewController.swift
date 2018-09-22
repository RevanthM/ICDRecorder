//
//  SpeechViewController.swift
//  ICD_Entry
//
//  Created by Revanth Matha on 9/10/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit
import Foundation

class SpeechViewController: UIViewController {
    
    var StringEncoded = ""

    @IBOutlet weak var textBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PostMessage(_ sender: Any) {
        
    var StringEncoded = textBox.text
        
        let utf8StringEncoded =  StringEncoded?.data(using: String.Encoding.utf8)
        
        let base64Encoded = utf8StringEncoded?.base64EncodedData()
        
        print("Encoded:  \(base64Encoded)")
        
        
        
     do {
        
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "b3ab251e-78c9-409d-a550-b642b0a41f42"
        ]
        let parameters = [
            "body": "\(base64Encoded)",
            "description": "hi this is a test",
            "icd": "gkjghkuhkh"
            ] as [String : Any]
        
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://werw32zcbe.execute-api.us-east-1.amazonaws.com/EmailICD")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
        
     } catch {
        print(error)
        // or display a dialog
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
