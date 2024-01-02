//
//  DocumentsDirectoryView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 1/1/24.
//

import SwiftUI

// finding the users documents directory
// https://www.hackingwithswift.com/example-code/system/how-to-find-the-users-documents-directory


extension FileManager {
    enum FileError: Error {
        case notDecoded
    }
    
    // getting the users documents directory URL
    func getDocumentsDirectory() -> URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func decodeFile(filename: String) throws -> String {
        let url = URL.documentsDirectory.appending(path: filename)
        do{
            let decodedFile = try String(contentsOf: url)
            print(decodedFile)
            return decodedFile
        } catch {
            print(error.localizedDescription)
            throw FileError.notDecoded
        }
    }
    
    func GENERICdecodeFile<T: Decodable >(filename: String) throws -> T {
        let url = URL.documentsDirectory.appending(path: filename)
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(filename) from bundle.")
        }
        print("Data + \(data)")
        let decoder = JSONDecoder()

        guard let loaded: T = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(filename) from bundle.")
        }
        return loaded
    }
    
    func encodeFile<T: Codable>(input: T, filename: String) throws{
        let encoder = JSONEncoder()
        let encoded = try encoder.encode(input)
        let url = URL.documentsDirectory.appending(path: filename)
        do {
            try encoded.write(to: url)
        }
        catch {
            fatalError("There was an issue with the writing")
        }
    }
}

struct DocumentsDirectoryView: View {
    var body: some View {
        Button("Read and write"){
            let data  = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do{
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                try FileManager.default.encodeFile(input: "Hello Worls", filename: "henny.txt")
//                let input = try String(contentsOf: url)
//                print(input)
                let decodedString = try FileManager.default.decodeFile(filename: "message.txt")
                print("aaaaafter")
                print(decodedString)
                let hennyDecoded: String = try FileManager.default.GENERICdecodeFile(filename: "henny.txt")
//                let secondAttempt: String = try FileManager.default.GENERICdecodeFile(filename: "message.txt")
//                print(secondAttempt)
                print(hennyDecoded)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func test() {
        print(URL.documentsDirectory)
      
    }
    
}

#Preview {
    DocumentsDirectoryView()
}
