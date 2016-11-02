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
        if self.startNumberTextField.text == nil ||
                self.startNumberTextField.text! == "" ||
                self.endNumberTextField.text == nil ||
                self.endNumberTextField.text! == "" {
            let alert = UIAlertController(title: "Check Error", message: "Please Confirm Input Two Number", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
            rtnVal = false
        } else {
            startNum = Int(self.startNumberTextField.text!)
            endNum = Int(self.endNumberTextField.text!)
            if startNum > endNum {
                let alert = UIAlertController(title: "Check Error", message: "End Number Must Be More Than Start Number", preferredStyle: .Alert)
                let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
                rtnVal = false
            }
        }
        return rtnVal
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

