//
//  InitialDataModel.swift
//  Arcadix_Swift_Framework
//
//  Created by adas on 06/06/23.
//

import Foundation

public class InitialDataModelImp {
    
    public init() {}
    
    public func get<T: Decodable>(url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
//        let (data, res) = try await URLSession.shared.data(from: url)
//        print("res \(res)")
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
