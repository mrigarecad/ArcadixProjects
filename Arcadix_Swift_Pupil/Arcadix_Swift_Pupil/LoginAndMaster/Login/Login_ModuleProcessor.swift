//
//  Login_ModuleProcessor.swift
//  Arcadix_Swift_Pupil
//
//  Created by adas on 09/06/23.
//

import Foundation
import Arcadix_Swift_Object
import Arcadix_Swift_Framework

class Login_ModuleProcessor : ObservableObject{
    
//    let clientUrl = "https://lernende.lernen-codoc.ch"
    let clientUrl : String
     
    init(clientUrl: String) {
        self.clientUrl = clientUrl
    }
    
    func GetInitialDataForPupilApp() {
        // With the DispatchGroup you can make concurrent API requests in Swift.

        // Create a dispatch group :
        // Use a DispatchGroup to keep track of multiple asynchronous tasks.
        let group = DispatchGroup()
        
        let clientUrl = "https://lernende.lernen-codoc.ch"
        let objArcadixFetchData = Arcadix_Swift_Framework.ArcadixFetchData()
        
        let initialControllerDataUrl = "\(clientUrl)/API/Extranet/Pupil/PupilStartController/GetInitialControllerData"
        let objLogin1 = Arcadix_Swift_Object.Login(url: initialControllerDataUrl, objArcadixFetchData: objArcadixFetchData)
        // Make HTTP Requests In Parallel :
        // When a new task starts, call group.enter(). When a task ends, call group.leave(). Always make sure to call group.leave() when a task completes.
        group.enter()
        objLogin1.getInitialData(group: group)
        
        let clientSettingsDataUrl = "\(clientUrl)/API/Object/ProductManagement/MainClient/ClientSettings?sessionkey=2104202310033584&displaydevice=PC&EnableJSONCompression=N"
        let objLogin2 = Arcadix_Swift_Object.Login(url: clientSettingsDataUrl, objArcadixFetchData: objArcadixFetchData)
        group.enter()
        objLogin2.ClientSettingsData(group: group)
        
        // Configure A Completion Callback :
        // When all tasks complete the DispatchGroup trigger a callback. Here, the .main queue is specified indicating that the callback block should be called on the main thread.
        group.notify(queue: .main) { [self] in
            // whatever you want to do when both are done
            print("All api calls for Pupil Login are done. Write your code here, when all work for thr group is complete")
//            initialControllerData = initialControllerDataTemp
//            clientSettingsData = clientSettingsDataTemp
//            jConfiguration = jConfigurationTemp
//
//            print("initialControllerData: \(initialControllerData)")
//            print("clientSettingsData: \(clientSettingsData)")
//            print("jConfiguration: \(jConfiguration)")
        }
    }
}
