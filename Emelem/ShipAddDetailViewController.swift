//
//  ShipAddDetailViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 6/11/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ShipAddDetailViewController: UIViewController {
    
    
    @IBOutlet weak var addressTitleTextField: UITextField!
    @IBOutlet weak var streetAddTextField: UITextField!
    @IBOutlet weak var aptTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!

    var address: ShippingAddress?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func savebuttonPressed(sender: UIButton) {
        //call save address function
        var addressTitle = addressTitleTextField.text
        var streetAddress = streetAddTextField.text
        var aptNo = aptTextField.text
        var city = cityTextField.text
        var state = stateTextField.text
        var zip = zipTextField.text
        
       
        
        
        
//        streetAddTextField.text = address!.streetAddress as String
//        println(address?.streetAddress)
//        aptTextField.text = address!.apt as String
//        println(address?.apt)
//        cityTextField.text = address!.city as String
//        println(address?.city)
//        stateTextField.text = address!.state as String
//        println(address?.state)
//        zipTextField.text = address!.zip as String
//        saveAddress(address!)
    }
    
    
    
 
}
