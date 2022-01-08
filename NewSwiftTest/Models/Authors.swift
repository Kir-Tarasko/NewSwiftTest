//
//  Authors.swift
//  NewSwiftTest
//
//  Created by Arslan Abdullaev on 08.01.2022.
//

import Foundation

struct Author {

    var name: String
    var surname: String
    var nickname: String
    var fullname: String {
        "\(name) \(surname)"
    }
}

extension Author {
    static func getInfo() -> [Author] {
        
        var authorArray: [Author] = []
        
        let names = AuthorsData.shared.names
        let surnames = AuthorsData.shared.surnames
        let nicknames = AuthorsData.shared.nicknames
        
        let iterationCount = min(
            names.count,
            surnames.count,
            nicknames.count
        )
        
        for index in 0..<iterationCount {
            let authors = Author(
                name: names[index],
                surname: surnames[index],
                nickname: nicknames[index]
            )
            
            authorArray.append(authors)
        }
        return authorArray
    }
}

