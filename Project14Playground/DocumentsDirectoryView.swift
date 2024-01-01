//
//  DocumentsDirectoryView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 1/1/24.
//

import SwiftUI

struct DocumentsDirectoryView: View {
    var body: some View {
        Button("Read and write"){
            let data  = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do{
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
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
