//
//  ComparableView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 12/31/23.
//

import SwiftUI

struct User : Identifiable, Comparable {
    var id = UUID()
    var firstName: String
    var lastName: String
    
    static func < (lhs: User, rhs: User) ->  Bool {
        return lhs.lastName < rhs.lastName
    }
}


struct ComparableView: View {
    let users = [
        User(firstName: "Henny", lastName: "B"),
        User(firstName: "Jose", lastName: "Ramirez"),
        User(firstName: "Macie", lastName: "McMillan"),
        User(firstName: "Rachel", lastName: "Berglund")
    ].sorted()
    // can use the basic sorted() functiin now because we made User conform to Comparable and provided a function to sort by otherwise we would have had to do this
//        .sorted {
//            $0.lastName < $1.lastName
//        }
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ComparableView()
}
