//
//  File.swift
//  
//
//  Created by Besar Ismaili on 23/08/2019.
//

import Foundation

public struct Slacker {
    
    init(message: String) {
        let Url = String(format: "https://hooks.slack.com/services/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")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["text" : "Test from swift!!!"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
