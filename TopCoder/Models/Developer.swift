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
      Developer(id: 0, name: "Chris Lattner", stars: 5, imageURL: URL(string: "https://media-exp1.licdn.com/dms/image/C5603AQHQPhRmc0bE7g/profile-displayphoto-shrink_800_800/0/1584297818537?e=1634774400&v=beta&t=ZBBITjFEHCRnNc-wqY_T8t3BhW-b06VGAd0tIQ72pvg")! ),
      Developer(id: 1, name: "Steve Wozniak", stars: 5, imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Steve_Wozniak_by_Gage_Skidmore.jpg/896px-Steve_Wozniak_by_Gage_Skidmore.jpg")!),
      Developer(id: 2, name: "Linus Torvalds", stars: 5, imageURL: URL(string: "https://i.blogs.es/195f61/linus1/1366_2000.jpg")!),
      Developer(id: 3, name: "Juan Pérez", stars: 2, imageURL: nil),
      Developer(id: 4, name: "John Doe", stars: 1, imageURL: nil),
    ]
  }
}
