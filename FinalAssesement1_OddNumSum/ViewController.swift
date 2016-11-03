//
//  ViewController.swift
//  FinalAssesement1_OddNumSum
//
//  Created by Chiu Chih-Che on 2016/11/1.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startNumberTextField: UITextField!
    @IBOutlet weak var endNumberTextField: UITextField!
    @IBOutlet weak var sumResult: UITextField!
    var startNum: Int?
    var endNum: Int?
    
    
    @IBAction func resetButton(sender: AnyObject) {
        self.startNumberTextField.text = ""
        self.endNumberTextField.text = ""
        self.sumResult.text = ""
    }
    
    @IBAction func runButton(sender: AnyObject) {
        if checkField() {
            self.sumResult.text = NumberUtils.oddNumberSum(startNum!, endNum: endNum!)
        }
    }
    
    func checkField() -> Bool {
        var rtnVal: Bool = true
        if let startText = self.startNumberTextField.text where !startText.isEmpty {
            if let endText = self.endNumberTextField.text where !endText.isEmpty {
                startNum = Int(startText)
                endNum = Int(endText)
                if startNum > endNum {
                    alertControl2()
                    rtnVal = false
                }
            } else {
                alertControl1()
                rtnVal = false
            }
        } else {
            alertControl1()
            rtnVal = false
        }
        
        return rtnVal
    }
    
    func alertControl1() {
        let alert = UIAlertController(title: "Check Error", message: "Please Confirm Input Two Number", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func alertControl2() {
        let alert = UIAlertController(title: "Check Error", message: "End Number Must Be More Than Start Number", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

