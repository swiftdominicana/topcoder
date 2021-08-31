//
//  Developer.swift
//  Developer
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import Foundation

struct Developer: Identifiable, Hashable {
  let id: Int
  let name: String
  let stars: Int
  let imageURL: URL?

  static var dummyData: [Developer] {
    [
      Developer(id: 0, name: "Chris Lattner", stars: 5, imageURL: URL(string: "https://bit.ly/2WF1S8e")! ),
      Developer(id: 1, name: "Steve Wozniak", stars: 5, imageURL: URL(string: "https://bit.ly/3kG83Bt")!),
      Developer(id: 2, name: "Linus Torvalds", stars: 5, imageURL: URL(string: "https://bit.ly/3DBYn3o")!),
      Developer(id: 3, name: "Juan Pérez", stars: 2, imageURL: nil),
      Developer(id: 4, name: "John Doe", stars: 1, imageURL: nil),
    ]
  }
}
