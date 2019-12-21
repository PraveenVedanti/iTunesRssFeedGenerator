//
//  NetworkManager.swift
//  iTunesRssFeedGenerator
//
//  Created by Praveen on 12/20/19.
//  Copyright © 2019 Praveen. All rights reserved.
//

import Foundation
typealias model = [String:Any]

class NetworkManager {
    
    func getDataFromNetwork(url:URL, completion:@escaping(_ data:model? , _ error:Error? ) -> Void) {
        let urlRequest = URLRequest(url: url)
        
        // Create a background task to get data from server.
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            // Check for error. If there is error, return
            guard error == nil else {
                completion(nil,error)
                return
            }
            
            // Check for proper data
            guard let responseData = data else {
                completion(nil,error)
                return
            }
            
            do {
                guard let response = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? model else {
                    completion(nil,error)
                    return
                }
                completion(response,nil)
            } catch {
                completion(nil,error)
                return
            }
        }.resume()
    }
}
