//
//  ContentView.swift
//  TopCoder
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

  var body: some View {
    NavigationView {
      List(searchResults) { dev in
        VStack(alignment: .leading) {
          HStack {
            CoderProfileImageView(imageURL: dev.imageURL)
            VStack(alignment: .leading) {
              Text(dev.name)
              HStack {
                ForEach(0..<5) { i in
                  Image(systemName: dev.stars >= i ? "star.fill" : "star")
                }
              }
            }
            Spacer()
            Button("Follow") {
              developerSelected = dev
              isConfirming = true
            }
            .tint(Color.green)
            .buttonStyle(.borderedProminent)
            .disabled(isFollowing(dev))
            .buttonBorderShape(.capsule)
            .controlSize(.small)
            .padding([.trailing], 5)
          }
        }
        .swipeActions {
          Button(
              role: .destructive,
              action: {
                  withAnimation {
                    if let index = devs.firstIndex(of: dev) {
                      _ = devs.remove(at: index)
                    }
                  }
              }
          ) {
              Image(systemName: "trash")
          }
        }
        .confirmationDialog(
            "Are you sure?",
            isPresented: $isConfirming,
            titleVisibility: .visible,
            presenting: developerSelected
        ) { dev in
            Button("Follow") {
              withAnimation {
                follow(dev)
              }
            }.keyboardShortcut(.defaultAction)

            Button("Cancel", role: .cancel) {}
        } message: { dev in
          Text("This will add \(dev.name) to your top coders list")
        }
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

  var searchResults: [Developer] {
    guard !searchQuery.isEmpty else {
      return devs
    }

    return devs.filter { $0.name.contains(searchQuery) }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CoderList()
      // .previewInterfaceOrientation(.landscapeLeft)
  }
}
