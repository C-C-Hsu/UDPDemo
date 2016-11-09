//
//  ViewController.swift
//  UDPDemo
//
//  Created by 許家旗 on 2016/11/9.
//  Copyright © 2016年 許家旗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let client: UDPClient = UDPClient(addr: "192.168.43.3", port: 16888)
    
    @IBAction func b_on(_ sender: UIButton) {
        
        NSLog("ON")
        sendCmd(cmd: "ON")
    }
    
    @IBAction func b_off(_ sender: UIButton) {
        
        NSLog("OFF")
        sendCmd(cmd: "OFF")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        let (success, msg) = client.close()
        
        if (success) {
            print(msg)
        }
        else {
            print("Error. " + msg)
        }
    }
    
    func sendCmd(cmd: String) {
        
        let (success, msg) = client.send(str: cmd)
        
        if (success) {
            print(msg)
        }
        else {
            print("Error. " + msg)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

