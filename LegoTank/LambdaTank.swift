//
//  LambdaTank.swift
//  LegoTank
//
//  Created by Rafal Kuklinski on 28/04/2023.
//

import Foundation



public class LambdaTank : Tank {

    
    override func sendMessage(text: String) {
        fatalError("Subclass must implement this method")
    }

    
    override func connect(host: String) -> Bool {
        fatalError("Subclass must implement this method")
        /*
        import AWSLambda

        // Set up the Lambda client
        let lambda = AWSLambda.default()

        // Create a request to invoke the Lambda function
        let request = AWSLambdaInvocationRequest()
        request.functionName = "your-lambda-function-name"
        request.payload = "your-payload-as-string".data(using: .utf8)

        // Invoke the Lambda function asynchronously
        lambda.invoke(request) { (response, error) in
          if let error = error {
            print("Error invoking Lambda function: \(error)")
          } else if let payload = response?.payload {
            print("Lambda function returned payload: \(String(data: payload, encoding: .utf8) ?? "")")
          }
        }
*/
    }

    override func disconnect() {
        fatalError("Subclass must implement this method")
    }

}
