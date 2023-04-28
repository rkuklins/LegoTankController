//
//  Tank.swift
//  LegoTank
//
//  Created by Rafal Kuklinski on 28/04/2023.
//

import Foundation


public class Tank {
    
    func moveForward() {
        sendMessage(text: "EngineAhead!")
    }
    
    func stopMove() {
        sendMessage(text: "EngineStop!")
    }
    
    
    func moveBackward() {
        sendMessage(text: "EngineBack!")
    }
    
    func turnLeft () {
        sendMessage(text: "TurnLeft!")
    }
    
    func turnRight () {
        sendMessage(text: "TurnRight!")
    }
    
    
    func sendMessage(text: String) {
        fatalError("Subclass must implement this method")
    }

    
    func connect(host: String) -> Bool {
        fatalError("Subclass must implement this method")
    }

    func disconnect() {
        fatalError("Subclass must implement this method")
    }
    
    
}
