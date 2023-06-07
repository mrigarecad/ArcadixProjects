//
//  TestFrameworkView.swift
//  Arcadix_Swift_Framework
//
//  Created by adas on 05/06/23.
//

import SwiftUI

public struct TestFrameworkView: View {
    private var Name : String
    private var Email : String
    
    public init(name: String, email: String) {
        self.Name = name
        self.Email = email
    }
    
    public var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Name: ")
                        .font(.title)
                    Text(Name)
                        
                }
                .padding()
                
                
              
                
                HStack {
                    Text("Email: ")
                        .font(.title)
                    Text(Email)
    //                    .font(.ti)
                }
                .padding()
                
                
//                Spacer()
            } //: VSTACK
            
        } //: ZSTACK
        .frame(height: 200)
        .containerShape(
            Rectangle()
        )
        .cornerRadius(15)
    } //: body
    
}

struct TestFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        TestFrameworkView(name: "Name", email: "E-mail")
    }
}

