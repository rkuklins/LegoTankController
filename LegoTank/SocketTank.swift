//
//  SocketTank.swift
//  LegoTank
//
//  Created by Rafal Kuklinski on 28/04/2023.
//

import Foundation


public class SocketTank : Tank {
    
    var inputStream: InputStream?
    var outputStream: OutputStream?
    var input: InputStream?
    var output: OutputStream?
    
    override func sendMessage(text: String) {
        // Send text to the socket
        let data = text.data(using: .utf8)!
        let bytesWritten = data.withUnsafeBytes {
            outputStream?.write($0, maxLength: data.count)
        }
        if bytesWritten! < 0 {
            print("Error writing to socket: \(outputStream?.streamError?.localizedDescription ?? "unknown error")")
        } else {
            print("Sent \(bytesWritten!) bytes to socket")
        }
    }

    
    override func connect(host: String) -> Bool {
        //TODO: Call lambda function to generate
         // Set up the socket host and port
        
        let port = 27700

        // Create a socket object and open a connection
        Stream.getStreamsToHost(withName: host, port: port, inputStream: &inputStream, outputStream: &outputStream)
        if let input = inputStream, let output = outputStream {
            inputStream?.open()
            outputStream?.open()
            
            if input.hasBytesAvailable || output.hasSpaceAvailable {
                print("Connection established")
                return true
            } else {
                print("Connection failed")
                return false
            }
        } else {
            print("Failed to open connection to \(host):\(port)")
            return false
        }
    }

    override func disconnect() {
        // Close the connection
        inputStream?.close()
        outputStream?.close()
    }
}
