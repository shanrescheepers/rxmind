//
//  ContentView.swift
//  BiometricAuth
//
//  Created by Ege Sucu on 18.10.2022.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var authController = AuthController()
    @State private var status = "Status:"
    @State private var biometricAvailable = true
    @State private var isAuthenticated = false // Add this state

    @State private var isAuthenticationEnabled = UserDefaults.standard.bool(forKey: "isAuthenticationEnabled")

    
    var body: some View {
        
        NavigationView{
            ZStack{
                //        2nd VStack
                Image("profile").resizable()
                
                VStack {
                   
             
            VStack{
                Text(status)
                    .foregroundColor(biometricAvailable ? .primary : .white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 100)
                    .padding(.bottom, 50)
                
                if isAuthenticationEnabled && authController.biometricType == .faceID {
                                Button {
                                    authenticate()
                                } label: {
                                    Label("Use FaceID", systemImage: "faceid")
                                }
                                .buttonStyle(.bordered)
                            } else if isAuthenticationEnabled && authController.biometricType == .touchID {
                                Button {
                                    authenticate()
                                } label: {
                                    Label("Use TouchID", systemImage: "touchid")
                                }
                                .buttonStyle(.bordered)
                            } else {
                                Group{
                                    Text("Authentication is disabled").foregroundColor(Color(red: 0.4117647059, green: 0.5294117647, blue: 0.537254902, opacity: 1.0)).font(.system(size: 20))
                                    
                                    NavigationLink("", destination: DashView(), isActive: $isAuthenticated)
                                        .opacity(0) // Make the link invisible
                                }
                            }
                NavigationLink("", destination: DashView()
                    .navigationBarHidden(true)
                               
                    .navigationBarBackButtonHidden(true), isActive: $isAuthenticated)
                    .opacity(0)
                
                Spacer()
            }.onAppear(perform: checkPermission)
        }
            }
            .ignoresSafeArea()
        }
    }
    
    func checkPermission(){
        authController.askBiometricAvailability { error in
            if let error{
                status = "Status: " + "\n" + error.localizedDescription
                biometricAvailable = false
            } else {
                biometricAvailable = true
            }
        }
    }
    
    func authenticate() {
            authController.authenticate { result in
                switch result {
                case .success(_):
                    status = "Status:" + "\n Logged In."
                    isAuthenticated = true // Set the state to trigger navigation
                case .failure(let failure):
                    status = "Status:" + failure.localizedDescription
                }
            }
        }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
