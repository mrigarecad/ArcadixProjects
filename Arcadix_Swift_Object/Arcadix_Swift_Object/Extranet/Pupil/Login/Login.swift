//
//  Login.swift
//  Arcadix_Swift_Object
//
//  Created by adas on 09/06/23.
//

import Foundation
import Arcadix_Swift_Framework

public class Login {
    var strURL: String
    var objArcadixFetchData : ArcadixFetchData
    
    public init(url: String, objArcadixFetchData : ArcadixFetchData) {
        self.strURL = url
        self.objArcadixFetchData = objArcadixFetchData
    }
    
    public func getInitialData(group: DispatchGroup?) {
        Task {
            guard let url = URL(string: strURL) else{
                return
            }
            var request = URLRequest(url: url)
            
            // method, body, headers
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Native", forHTTPHeaderField: "Device")
            objArcadixFetchData.fetchData(request: request) { response in
                print("response getInitialData\(response)")
                group?.leave()
            }
        }
    }
    
    public func ClientSettingsData(group: DispatchGroup?){
        Task {
           
            guard let url = URL(string: strURL) else{
                return
            }
            var request = URLRequest(url: url)
            // method, body, headers
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "content-type")
            request.setValue("Native", forHTTPHeaderField: "Device")
            
            objArcadixFetchData.fetchData(request: request) { response in
                print("response ClientSettingsData\(response)")
                group?.leave()
            }
        }
    }
}
