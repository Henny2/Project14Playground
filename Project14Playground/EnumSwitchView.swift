//
//  EnumSwitchView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 1/1/24.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Text("FAILED")
    }
}
struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}
struct SuccessView: View {
    var body: some View {
        Text("YAY!")
    }
}

struct EnumSwitchView: View {
    
    enum LoadingStates {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingStates.loading
    var body: some View {
        switch loadingState {
        case .failed:
            FailedView()
        case .success:
            SuccessView()
        case .loading:
            LoadingView()
        }
    }
}

#Preview {
    EnumSwitchView()
}
