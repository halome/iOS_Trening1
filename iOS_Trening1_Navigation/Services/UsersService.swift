//
//  UsersService.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 03/12/2020.
//

import UIKit

class UsersService: NSObject {
    public func fetchUsers(completion: @escaping (Data?) -> Void, onError: @escaping () -> Void)  {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        completion(data)
                    } else {
                        onError()
                    }
                }
            }.resume()
        }
    }
    
    public func parseDataToUsers(data: Data) -> [User] {
        do {
            let decoder = JSONDecoder()
            let users: [User] = try decoder.decode([User].self, from: data)
            
            return users
        } catch let error {
            print("json decode error: \(error)")
        }
        
        return []
    }
    
    public func fetchAndParseUsers(completion: @escaping (_ users: [User]) -> Void) -> Void {
        fetchUsers() { data in
            if let data = data {
                let result: [User] = self.parseDataToUsers(data: data)
                completion(result)
            }
        } onError: {
            print("error while fetching")
        }
    }
}
