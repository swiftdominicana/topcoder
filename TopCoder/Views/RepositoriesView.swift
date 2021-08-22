//
//  RepositoriesView.swift
//  RepositoriesView
//
//  Created by Libranner Leonel Santos Espinal on 22/8/21.
//

import SwiftUI

enum Origin: String {
  case apple
  case libranner
}

struct RepositoriesView: View {
  @State private var repositories = [Repository]()
  @State private var origin: Origin = .libranner

  var body: some View {
    NavigationView {
      VStack {
        if repositories.isEmpty {
          ProgressView()
        }
        else{
          VStack {
            Text("You're seeing **\(origin.rawValue)** repos")
              .font(.title3)

            List(repositories) { repo in
              VStack(alignment: .leading) {
                Text(repo.name)
                  .font(.headline)
                Text("\(repo.url)")
                  .lineLimit(1)
                  .font(.subheadline)
              }
            }
            .refreshable {
              origin = origin == .libranner ? .apple : .libranner
              Task {
                await reload()
              }
          }
          }
        }
      }
      .navigationTitle("Repositories")
      .task {
        repositories = (try? await getRepositories()) ?? []
      }
    }
  }

  private func reload() async {
    repositories = (try? await getRepositories()) ?? []
  }

  private func getRepositories() async throws -> [Repository] {
    let urlString = "https://api.github.com/users/\(origin)/repos"
    let request = URLRequest(url: URL(string: urlString)!)
    let (data, response) = try await URLSession.shared.data(for: request)
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
      return []
    }

    let repos = try? JSONDecoder().decode([Repository].self, from: data)
    return repos ?? []
  }
}

struct RepositoriesView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}
