import Foundation

class MenuLoader  {
    
    private var menuItems: [AutoCar] = []
//
//    init() async {
//        await getCars()
//    }

//    func loadMenu() {
//        // Assuming your JSON file is named "menu.json" and is in your app bundle
//        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json") else {
//            print("Menu JSON file not found.")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decodedItems = try JSONDecoder().decode([MenuItem].self, from: data)
//            self.menuItems = decodedItems
//        } catch {
//            print("Error decoding menu JSON: \(error)")
//        }
//    }
//    func getCars() async throws {
//        let endpoint = "http://srshepherdjr.ddns.net:8888/api/v1/mycars/findActiveCars"
//        guard let url = URL(string: endpoint) else {
//            throw MLAPIErrors.invalidURL
//        }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw MLAPIErrors.invalidAPIResponse
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let carData: [AutoCar] = try decoder.decode([AutoCar].self, from: data)
//            self.menuItems = carData
//        } catch {
//            throw MLAPIErrors.InvalidAPIData
//        }
//    }

}//
//  Services.swift
//  Maintenance Logger
//
//  Created by Steven Shepherd on 11/7/25.
//

