//
//  OldICDViewController.swift
//  ICD_Entry
//
//  Created by Anand on 14/10/18.
//  Copyright © 2018 Revanish. All rights reserved.
//

import UIKit

class OldICDViewController: UIViewController {
    
    @IBOutlet var newTable: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension OldICDViewController: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(appDelegate.icdMessageArray.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = newTable.dequeueReusableCell(withIdentifier: "cell") as! ChronicCell
        let icdObj = appDelegate.icdMessageArray[indexPath.row]
        cell.icdLabel.text = icdObj.icd
        cell.descriptionLabel.text = icdObj.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
