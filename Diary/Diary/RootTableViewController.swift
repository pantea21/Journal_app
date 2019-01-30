//
//  RootTableViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/29/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

var subjects: [String] = []
var myIndex=0
var number_image:[UIImage] = []
var number_text: [String] = []
var flag = 0


class RootTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        
        if let x = UserDefaults.standard.object(forKey: "subjects") as? [String] {
            subjects = x
           
        }
        if let y = UserDefaults.standard.object(forKey: "number_image")  as? [NSData]{
            number_image = []
            for y1 in y {
                number_image.append(UIImage(data: y1 as Data)!)
                
            }
        }
        if let z = UserDefaults.standard.object(forKey: "number_text")  as? [String] {
            number_text = z
        }
        
        if let l = UserDefaults.standard.object(forKey: "flag")  as? Int {
             flag = l
        }

        
        if flag==0 {
            flag = 1
            load_for_first()
        }
        
        
       
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
         cell.labelCell.text = subjects[indexPath.row]
         cell.imageCell.image = number_image[indexPath.row]
       
        return cell
    }
 
 
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            subjects.remove(at: indexPath.row)
            number_image.remove(at: indexPath.row)
            number_text.remove(at: indexPath.row)
            //SAVE THE DATA
           
            UserDefaults.standard.set(subjects, forKey:"subjects" )
            var imageData :[NSData] = []
            for image in number_image {
                imageData.append(UIImagePNGRepresentation(image)! as NSData)
                
            }
            UserDefaults.standard.set(imageData, forKey:"number_image" )
            
            UserDefaults.standard.set(number_text, forKey:"number_text" )
            UserDefaults.standard.set(flag, forKey:"flag" )
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func load_for_first(){
        subjects.append("A Day near The Eiffel Tower")
        subjects.append("The Beauty of the Nature")
        subjects.append("Hope")
        
        number_image.append(#imageLiteral(resourceName: "Image-1"))
        number_image.append(#imageLiteral(resourceName: "Image-2"))
        number_image.append(#imageLiteral(resourceName: "Image-3"))
        
        let fileURLProject = Bundle.main.path(forResource: String(1), ofType: "txt")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
            number_text.append(readStringProject)
        } catch let error as NSError {
            print("Failed reading from URL")
        }
        var fileURLProject1 = Bundle.main.path(forResource: String(2), ofType: "txt")
        // Read from the file
        readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject1!, encoding: String.Encoding.utf8)
            number_text.append(readStringProject)
        } catch let error as NSError {
            print("Failed reading from URL")
        }
        let fileURLProject2 = Bundle.main.path(forResource: String(3), ofType: "txt")
        // Read from the file
        readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject2!, encoding: String.Encoding.utf8)
            number_text.append(readStringProject)
        } catch let error as NSError {
            print("Failed reading from URL")
        }
    }
}
