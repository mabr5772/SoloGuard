//
//  ContentView.swift
//  SoloGuard
//
//  Created by Sam Chen on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginView = false
    @State private var createNewAccount = false
    @State private var audioPlayer = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo2")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("SOLOGUARD")
                    .font(.system(size: 30))
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding()
                    .padding(.bottom, 100)
        
                    Button("Log in") {
                        if (showLoginView == false) {
                            showLoginView = true
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.button2)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                
                    NavigationLink(destination: LoginView(), isActive: $showLoginView){
                        EmptyView()
                    }
                
                Text("")
                
                Button("Create an account") {
                    if (createNewAccount == false) {
                        createNewAccount = true
                    }
                }
                
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.button2)
                .cornerRadius(5)
                .shadow(radius: 5)
                
                NavigationLink(destination: CreateNewAccount(), isActive: $createNewAccount){
                    EmptyView()
                }
                
                Text("")
                
                Button("Call") {
                    if (audioPlayer == false) {
                        audioPlayer = true
                    }
                }
                
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.button2)
                .cornerRadius(5)
                .shadow(radius: 5)
                
                NavigationLink(destination: AudioPlayer(), isActive: $audioPlayer){
                    EmptyView()
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.bg2)
        }
    }
}


#Preview {
    ContentView()
}
