//
//  ContentView.swift
//  Maintenance Logger
//
//  Created by Steven Shepherd on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false	
    @State private var cars: [AutoCar]?
    @StateObject var viewModel = MyViewModel()

    var body: some View {
        VStack {

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(10)

            .padding(5)
            Text("Maintenance Logger")
            NavigationView {
                List(viewModel.items) { item in
                    VStack(alignment: .leading) {
                        Text("\(item.modelYear) " + item.carMake)
                            .font(.headline)
                        Text(item.carModel)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("My Cars")
                .onAppear {
                    viewModel.fetchItems()
                }
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
            Button("Quit") {
                exit(0)
            }

        }
//        .task {
//            do {
//                cars = try await getCars()
//            } catch MLAPIErrors.InvalidAPIData {
//                print("InvalidAPIData error")
//            } catch MLAPIErrors.invalidAPIResponse {
//                print("invalidAPIResponse error")
//            } catch MLAPIErrors.invalidURL {
//                print("invalidURL error")
//            } catch {
//                print(error)
//                print("unexpected error")
//            }
//
//        }
      
    }
    func getCars() async throws -> [AutoCar] {
        let endpoint = "https://srshepherdjr.ddns.net:8888/api/v1/mycars/findActiveCars"
        guard let url = URL(string: endpoint) else {
            throw MLAPIErrors.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MLAPIErrors.invalidAPIResponse
        }
        let jsonData: Data = data // ... your API response Data ...

        if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
           let prettyPrintedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
           let jsonString = String(data: prettyPrintedData, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Error: Could not pretty-print JSON or data is malformed.")
            // You might also want to print the raw data as a string for debugging
            if let rawString = String(data: jsonData, encoding: .utf8) {
                print("Raw JSON Data: \(rawString)")
            }
        }
        print(data)
        do {
            let decoder = JSONDecoder()
            let carData: [AutoCar] = try decoder.decode([AutoCar].self, from: data)
            return carData
        } catch {
            throw MLAPIErrors.InvalidAPIData
        }
    }
}

#Preview {
    ContentView()
    
}
