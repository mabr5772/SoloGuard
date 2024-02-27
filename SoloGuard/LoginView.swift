//
//  LoginView.swift
//  SoloGuard
//
//  Created by Sam Chen on 1/20/24.
//

import SwiftUI
import Foundation

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 6) {
                Text("Log in")
                    .font(.system(size: 40))
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(.top, 50)
                    .padding(.bottom, 50)
                
                TextField("Email address", text: $username)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background()
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongUsername))
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
                
                VStack {
                    Button("Log in") {
                        authenticateUser(username: username, password: password)
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
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "jich7678@colorado.edu" {
            wrongUsername = 0
            if password.lowercased() == "samchen" {
                wrongPassword = 0
                showLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome!")
                    .font(.system(size: 40))
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding()
                
                Text("\("@jich7678@colorado.edu")")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.perry)
        }
    }
}

#Preview {
    LoginView()
}
