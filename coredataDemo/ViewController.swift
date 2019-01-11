//
//  ViewController.swift
//  coredataDemo
//
//  Created by Harshil sureshbhai dobariya on 10/01/19.
//  Copyright © 2019 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var studarr = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fatchrequest : NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let student = try PersistenceService.context.fetch(fatchrequest)
            self.studarr = student
            self.tableView.reloadData()
        } catch{
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func AddBTN(_ sender: Any) {
        
        //alert controller
        
        let alert = UIAlertController(title: "Add Detail", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "name"
        }
            alert.addTextField{(textField) in
                textField.placeholder = "spaciality"
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "age"
                textField.keyboardType = .numberPad
            }
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            let name:String = alert.textFields![0].text!
            let speciality:String = alert.textFields![1].text!
            let age:String = alert.textFields![2].text!
            print(name)
            print(age)
            print(speciality)
            
            let student = Student(context: PersistenceService.context)
            student.name = name
            student.spaciality = speciality
            student.age = Int16(age)!
            PersistenceService.saveContext()
            
            self.studarr.append(student)
            
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }

//    tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.nameLBL.text = studarr[indexPath.row].name
        cell.spacialityLBL?.text = studarr[indexPath.row].spaciality
        cell.ageLBL?.text = String(studarr[indexPath.row].age)
        self.tableView.rowHeight = 110
        return cell
    }
//        deleting row or remove row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            studarr.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
}
