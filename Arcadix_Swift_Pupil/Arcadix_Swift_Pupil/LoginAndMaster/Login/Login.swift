//
//  Login.swift
//  Arcadix_Swift_Pupil
//
//  Created by adas on 09/06/23.
//

import SwiftUI


struct Login: View {
    
    @ObservedObject var login_ModuleProcessor = Login_ModuleProcessor(clientUrl: "https://lernende.lernen-codoc.ch")
    var body: some View {
        VStack {
            Text("Login push test!!!!!!")
        }
        .onAppear {
            login_ModuleProcessor.GetInitialDataForPupilApp()
        }
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
