//
//  ViewController.swift
//  LegoTank
//
//  Created by Rafal Kuklinski on 23/04/2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var txtHostname: UITextField!

    var connectStatus: Bool = false
    var tank: Tank = SocketTank()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SendMessage(_ sender: UIButton) {
        if let text = txtMessage.text {
            print("Sending:" + text)
            tank.sendMessage(text: text)
        }
    }
    
    
    @IBAction func UpButtonTouch(_ sender: UIButton) {
        print("Button Up pressed")
        tank.moveForward()
    }
    
    @IBAction func UpButtonRelease(_ sender: UIButton) {
        print("Button Up released")
        tank.stopMove()
    }
    
    
    @IBAction func DownButtonPressed(_ sender: UIButton) {
        print("Button Down pressed")
        tank.moveBackward()
        
    }
    
    
    @IBAction func DownButtonRelease(_ sender: UIButton) {
        print("Button Down released")
        tank.stopMove()
    }
    
    
    @IBAction func RightPressed(_ sender: UIButton) {
        print("Right pressed")
        
        tank.turnRight()
    }
    
    
    @IBAction func RightReleased(_ sender: UIButton) {
        print("Right released")
        tank.stopMove()
        
    }
    
    @IBAction func LeftPressed(_ sender: UIButton) {
        print("Left pressed")
        tank.turnLeft()
    }
    
    
    @IBAction func LeftReleased(_ sender: UIButton) {
        print("Left released")
        tank.stopMove()
    }
    
    @IBAction func ConnectReleased(_ sender: UIButton) {
        
        // Do any additional setup after loading the view.
        if !connectStatus, let hostname = txtHostname.text {
            
            if tank.connect(host:hostname) {
                print("Connection established")
                sender.setTitle("Disconnect", for: .normal)
                connectStatus = true
            } else {
                print("No cats in the tank")
            }
        } else {
            tank.disconnect();
            connectStatus = false
            sender.setTitle("Connect", for: .normal)
        }
        
    }

    
    
    
    

}

