//
//  ContentView.swift
//  Arcadix_Swift_Pupil
//
//  Created by adas on 05/06/23.
//

import SwiftUI
import Arcadix_Swift_Framework
import Arcadix_Swift_Resources

struct ContentView: View {
    private let initialDataModelImp = InitialDataModelImp()
    @State private var users : User = User(name: "", email: "")
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: ArcadixSwiftResourcesImageProvider.Media.tesla.image)
                    .resizable()
                    .scaledToFit()
                .frame(width: 100, height: 100)
                
//                Image(uiImage: ArcadixSwiftResourcesImageProvider.ExtranetPupilMedia.random2.image)
//                    .resizable()
//                    .scaledToFit()
//                .frame(width: 100, height: 100)
                
                Image(uiImage: ArcadixSwiftResourcesImageProvider.TestApplicationMedia.random1.image)
                    .resizable()
                    .scaledToFit()
                .frame(width: 100, height: 100)
            }
            
            Spacer()
            
            Text("Hello, Pupil App!")
            
            Spacer()
            
            TestFrameworkView(name: users.name, email: users.email)
        }
        .onAppear{
            fetchUsers()
        }
        .padding()
    }
    
    private func fetchUsers() {
        Task {
            
            do {
                let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
                let users : [User] = try await initialDataModelImp.get(url: url)
                self.users = users[0]
                print(users)
                
            } catch {}
        }
    }
}

struct User: Decodable {
    let name: String
    let email: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
