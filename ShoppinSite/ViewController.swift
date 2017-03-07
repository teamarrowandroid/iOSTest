//
//  ViewController.swift
//  ShoppinSite
//
//  Created by harpreet singh on 2017-02-21.
//  Copyright © 2017 assignment2. All rights reserved.
//



// Name- Harpreet Singh
// Student ID - 300912078
// Date - 21 Fab,2017
//Purpose - Mid Term Test


import UIKit
import Firebase    //importing firebase
import FirebaseDatabase //importing firebasedatabase



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var list:[String]=["new"]                    // list  to store items
    var quanty:[String]=["1"]                    // list  to store quantity
    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet var tableContent: UITableView!      // reference to handle tableview reload
    @IBOutlet weak var listName: UITextField!       // List Name
    @IBOutlet weak var enterItem: UITextField!      // item name
    @IBOutlet weak var quantity: UILabel!           // quantity of item
    @IBAction func stepper(_ sender: UIStepper)      // stepper function to handle quantity
    {
        var a = Int(sender.value)
        quantity.text=String(a)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addbutton.layer.cornerRadius=addbutton.frame.size.width/2
        
    }

// function to return numberfo rows
 public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return list.count
    }
    // function to handle every cell of table
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "rows", for: indexPath) as! TableViewCell
        
        let item = cell.viewWithTag(1) as! UILabel
        
        item.text=list[indexPath.row]     //shows items in tableview
        
      
       let qunty=cell.viewWithTag(2) as! UILabel
        qunty.text=quanty[indexPath.row]  //shows quantity of items in table
     
        return cell
    }
    
    // perform fuction of 'Add' button to add item and its quantity in table view
    @IBAction func addList(_ sender: UIButton)
    {
        if(listName.text?.isEmpty==false)
        {
        self.list.append(enterItem.text!)
        self.quanty.append(quantity.text!)
        self.tableContent.reloadData()
        }
        else{
            listName.backgroundColor=UIColor.red
        }
    }
    
    // when click 'SAVE' store data on Firebase
    @IBAction func saveItems(_ sender: UIButton)
    {
        
        var ref=FIRDatabase.database().reference().child("Items")
        let newRef=ref.childByAutoId()
        newRef.setValue(list)
      
     
       
    }
      //clear arrays and tablelist when clicked 'CANCEL'
    @IBAction func cancel(_ sender: UIButton)
    {
        listName.text=""
        enterItem.text=""
        quantity.text=""
        list.removeAll()
        quanty.removeAll()
        self.tableContent.reloadData()
        
    }
    
      //function to delete rows/added items
    
     public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
     {
        if(editingStyle == UITableViewCellEditingStyle.delete)
        {
            self.list.remove(at: indexPath.row)        //remove items
            self.quanty.remove(at: indexPath.row)      //remove quantities of items
            
            tableContent.reloadData()
        }

    }
    
    
}

