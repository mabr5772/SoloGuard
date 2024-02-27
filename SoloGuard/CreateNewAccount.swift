//
//  CreateNewAccount.swift
//  SoloGuard
//
//  Created by Sam Chen on 1/20/24.
//

import SwiftUI
import Foundation

struct CreateNewAccount: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 6) {
                Text("Create an Account")
                    .font(.system(size: 35))
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(.top, 50)
                    .padding(.bottom, 30)
                
                TextField("First & Last name", text: $username)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongUsername))
                    .shadow(radius: 5)
                
                Text("")
                
                SecureField("Email address", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongPassword))
                    .shadow(radius: 5)
                
                Text("")
                
                SecureField("Phone number", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongPassword))
                    .shadow(radius: 5)
                
                Text("")
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongPassword))
                    .shadow(radius: 5)
                
                Text("")
                
                SecureField("Confirm password", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongPassword))
                    .shadow(radius: 5)
                
                Text("")
                
                HStack(spacing: 12) {
                  HStack(spacing: 0) {

                  }
                  .frame(width: 24, height: 24)
                  .background(Color.button2)
                  .cornerRadius(20)
                  Text("I have read and agree Terms & Conditions")
                    .font(Font.custom("Montserrat", size: 12).weight(.medium))
                    .lineSpacing(16)
                    .foregroundColor(.black)
                }
                .frame(width: 270, height: 24)
                .padding(.bottom, 40)
                
                VStack {
                    Button("Create account") {
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.button2)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    
                    NavigationLink(destination: WelcomeView(), isActive: $showLoginScreen){
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                
                Spacer()
                
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.bg2)
        }
    }
}

#Preview {
    CreateNewAccount()
}
