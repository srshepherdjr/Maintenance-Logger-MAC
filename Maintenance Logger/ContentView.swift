//
//  ContentView.swift
//  Maintenance Logger
//
//  Created by Steven Shepherd on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        VStack {

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(10)
            Image(systemName: "arrow.up")
                .cornerRadius(20)
                .padding(10)
                .onTapGesture {apGesture in
                    
                }
            Text("Hello, new world!")
                .padding(5)
            Button("Quit") {
                exit(0)
            }
            .padding(5)
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important Message", isPresented: $showingAlert) {
                Button("OK") {
                    // Handle OK button tap
                    print("OK tapped")
                }
                Button("Cancel", role: .cancel) {
                    // Handle Cancel button tap
                    print("Cancel tapped")
                }
            } message: {
                Text("Please read this message carefully.")
            }

        }
      
    }
}

#Preview {
    ContentView()
}
