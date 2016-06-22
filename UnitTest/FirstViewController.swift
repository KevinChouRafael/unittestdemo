//
//  FirstViewController.swift
//  UnitTest
//
//  Created by rafael on 6/14/16.
//  Copyright © 2016 kevin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField:UITextField!
    
    var sum:Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(sender: AnyObject) {
        firstLabel.text = textField.text
    }

    func sumFunction(a:Int,b:Int)->Int{
        
        return a + b
    }
    
    func multiplyBy(m:Int)->Int{
        sum = sum * m
        return sum
    }
    
}

