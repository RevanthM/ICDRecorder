//
//  ViewController.swift
//  ICD_Entry
//
//  Created by Revanth Matha on 9/9/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var newTable: UITableView!
    
    var networkClass = NetworkingData()
    
    
    
    @IBAction func segueButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "SpeechViewController") as! SpeechViewController
        navigationController?.pushViewController(destination, animated: true)
        
//        
//        performSegue(withIdentifier: "speechSegue", sender: self)
        
        
    }
    
    
    var ICDList = ["I51.9", "E11.65", "N18.9"]
    
    var descriptionList = ["Heart_Diesease", "Diabetes", "kidney failure"]
    
    var outputList = ["","",""]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        
        return(ICDList.count)
        
    }
    
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
     {
        
        let cell = newTable.dequeueReusableCell(withIdentifier: "cell") as! ChronicCell
      
        cell.icdLabel.text = ICDList[indexPath.row]
        cell.descriptionLabel.text = descriptionList[indexPath.row]
        
        return(cell)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
       
  
//
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let destination = storyboard.instantiateViewController(withIdentifier: "SpeechViewController") as! SpeechViewController
//        navigationController?.pushViewController(destination, animated: true)
//
//
//        performSegue(withIdentifier: "speechSegue", sender: self)
        
     
        }
    
    
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "speechSegue" {
//            // Setup new view controller
//        }
//    }
    
    let tasks=["Short walk",
               "Audiometry",
               "Finger tapping",
               "Reaction time",
               "Spatial span memory"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        newTable.dataSource = self
        newTable.delegate = self
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
