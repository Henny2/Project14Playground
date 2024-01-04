//
//  FaceIDView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 1/3/24.
//

import SwiftUI
import LocalAuthentication // to use FaceId and TouchID

struct FaceIDView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("LOCKED")
            }
        }.onAppear(perform: authenticate)
    }
    
    // 1. make instance of LAContext - which allows us to query biometric status and perform the authentication check
    // 2. Ask that context whether it’s capable of performing biometric authentication – this is important because iPod touch has neither Touch ID nor Face ID.
    // 3. If biometrics are possible, then we kick off the actual request for authentication, passing in a closure to run when authentication completes.
    // 4. When the user has either been authenticated or not, our completion closure will be called and tell us whether it worked or not, and if not what the error was.
    
    func authenticate() {
        print("running")
        let context = LAContext()
        var error: NSError?
        
        // step 2
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) // & let it be written inside that place
        {
            print("uses biometrics")
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // authenticated successfully
                    isUnlocked = true
                    print("unlocked!")
                } else {
                    // there was a problem
                    print("locked")
                }
            }
        } else {
            // no biometrics available
        }
    }
}

#Preview {
    FaceIDView()
}
