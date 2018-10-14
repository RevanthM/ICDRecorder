//
//  ViewController.swift
//  ICD_Entry
//
//  Created by Revanth Matha on 9/9/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit

class NewICDViewController: UIViewController {

    @IBOutlet var newTable: UITableView!
    
    var networkClass = NetworkingData()
    let icdSM = ICDServiceManager()
    
    var icdList = [[String]]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        newTable.dataSource = self
        newTable.delegate = self
        
        var data = readDataFromCSV(fileName: "icd10_file", fileType: "csv")
        data = cleanRows(file: data!)
        icdList = csv(data: data!)
        
        icdSM.getIDCMessages { [weak weakSelf = self] (icdArray, response, error) in
            weakSelf?.appDelegate.icdMessageArray = icdArray
            print(icdArray)
        }
    }
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            var columns = row.components(separatedBy: ",")
            if columns.count > 2 {
                var array = [String]()
                array.append(columns[1])
                columns.remove(at: 0)
                columns.remove(at: 0)
                let description = columns.joined(separator: ",")
                array.append(description.replacingOccurrences(of: "\"", with: ""))
                result.append(array)
            }
        }
        return result
    }
    
    @IBAction func segueButton(_ sender: UIButton) {
        let icdObj = icdList[sender.tag]
        performSegue(withIdentifier: "speechSegue", sender: icdObj)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "speechSegue" {
            if let speechVC = segue.destination as? SpeechViewController {
                speechVC.icdObj = sender as! [String]
            }
            // Setup new view controller
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewICDViewController: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(icdList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = newTable.dequeueReusableCell(withIdentifier: "cell") as! ChronicCell
        let icdObj = icdList[indexPath.row]
        cell.icdLabel.text = icdObj[0]
        cell.descriptionLabel.text = icdObj[1]
        cell.recordButton.tag = indexPath.row
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
