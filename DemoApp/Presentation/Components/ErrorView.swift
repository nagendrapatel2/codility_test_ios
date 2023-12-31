//
//  ErrorView.swift
//  DemoApp
//
//  Created by Nagendra on 03/10/23.
//

import SwiftUI
struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        VStack {
            Text("⚠️ \(errorMessage)")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
        
    }
}
