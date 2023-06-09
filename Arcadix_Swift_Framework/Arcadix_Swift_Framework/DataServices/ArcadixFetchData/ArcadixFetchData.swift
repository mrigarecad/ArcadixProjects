//
//  ArcadixFetchData.swift
//  Arcadix_Swift_Framework
//
//  Created by adas on 09/06/23.
//

import Foundation

public class ArcadixFetchData {
    
    public init() {}
    
    public func get<T: Decodable>(url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
//        let (data, res) = try await URLSession.shared.data(from: url)
//        print("res \(res)")
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    public func fetchData(request : URLRequest, completion: @escaping (Any)->()?) {
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error==nil else{
                return
            }
            do{
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("Response: \(response)")
                DispatchQueue.main.async {
                    completion(response)
                   
                }

            }
            catch{
                print(error)
                
            }
        }
        task.resume()
    }
}
