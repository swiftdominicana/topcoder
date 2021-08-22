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
        if let dev = developerSelected {
          DeveloperDetailView(developer: dev)
            .zIndex(3)
            .opacity(showModal ? 1 : 0)
            .onTapGesture {
              withAnimation {
                developerSelected = nil
                showModal = false
              }
            }
        }
        List {
          Section(header: Text("Following")) {
            ForEach(followingList) { dev in
              HStack {
                CoderProfileImageView(imageURL: dev.imageURL)
                VStack(alignment: .leading) {
                  Text(dev.name)
                    .font(.body)
                    .lineLimit(1)
                }
              }
            }
          }
          Section(header: Text("All Coders")) {
            ForEach(searchResults) { dev in
              VStack(alignment: .leading) {
                HStack {
                  CoderProfileImageView(imageURL: dev.imageURL)
                  VStack(alignment: .leading) {
                    Text(dev.name)
                      .font(.body)
                      .lineLimit(1)
                    HStack {
                      ForEach(0..<5) { i in
                        Image(systemName: dev.stars >= i ? "star.fill" : "star")
                      }
                      .symbolVariant(.slash.fill)
                      .foregroundStyle(.teal, .white)
                      .symbolRenderingMode(.multicolor)
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
                .onTapGesture {
                  withAnimation(.easeInOut(duration: 0.4)) {
                    developerSelected = dev
                    showModal = true
                  }
                }
              }
              .listRowSeparatorTint(Color.teal)
              .listRowSeparator(.visible, edges: .all)
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
          }
        }
        .zIndex(2)
        .listSectionSeparator(.visible, edges: .all)
        .listSectionSeparatorTint(Color.teal)
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
      .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    // .previewInterfaceOrientation(.landscapeLeft)
  }
}
