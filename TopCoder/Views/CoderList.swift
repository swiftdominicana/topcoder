//
//  CoderList.swift
//  CoderList
//
//  Created by Libranner Leonel Santos Espinal on 20/8/21.
//

import SwiftUI

struct CoderList: View {
  @State private var devs = Developer.dummyData
  @State private var searchQuery: String = ""
  @State private var following = Set<Developer>()
  @State private var isConfirming = false
  @State private var developerSelected: Developer?
  @State private var showModal = false

  var body: some View {
    NavigationView {
      ZStack(alignment: .top) {

      }
      .navigationBarTitle("Top Coders")
      .searchable(text: $searchQuery, placement: .automatic)
    }
  }

  func follow(_ developer: Developer) {
    if !following.insert(developer).inserted {
      following.remove(developer)
    }
  }

  func isFollowing(_ developer: Developer) -> Bool {
    return following.contains { $0.id ==  developer.id}
  }

  var followingList: [Developer] {
    Array(following)
  }

  var searchResults: [Developer] {
    guard !searchQuery.isEmpty else {
      return devs
    }

    return devs.filter { $0.name.contains(searchQuery) }
  }
}

struct CoderList_Previews: PreviewProvider {
  static var previews: some View {
    CoderList()
    // .previewInterfaceOrientation(.landscapeLeft)
  }
}
