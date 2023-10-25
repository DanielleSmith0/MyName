//
//  JSONManager.swift
//  MyName
//
//  Created by Danielle Smith on 10/13/23.
//

import Foundation
import CoreData

class JSONManager {
    static let shared = JSONManager()
    
    struct JSONObject: Codable {
        let Name: String
        let Meaning: String
    }
    
    func parseJSON() {
        
        guard let filePath = Bundle.main.path(forResource: "Names", ofType: "json") else {
            print("JSON file not found.")
            return
        }
        
        var objects: [JSONObject] = []
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            objects = try JSONDecoder().decode([JSONObject].self, from: jsonData)
            
        } catch {
            print("Error decoding JSON data: \(error)")
        }
        
        for object in objects {
            let objectEntity = Name(context: CoreDataManager.shared.context)
            objectEntity.title = object.Name
            objectEntity.meaning = object.Meaning
        }
    }
    
    func fetchCoreData() -> [Name] {

            do {
                return try CoreDataManager.shared.persistentContainer.viewContext.fetch(NSFetchRequest<Name>(entityName: "Name"))
            } catch {
                return []
            }
        }
    
    func testFetch() -> String {
        
        do {
            let testNameRequest = NSFetchRequest<Name>(entityName: "Name")
            
            let nameArr = try CoreDataManager.shared.persistentContainer.viewContext.fetch(testNameRequest)
            
            let lastName = nameArr.first
            
            let result = "\(String(describing: lastName?.title))" + "\(String(describing: lastName?.meaning))"
            
            print(result)
            
            return result
        } catch {
            return "Didn't work"
        }
    }
}


