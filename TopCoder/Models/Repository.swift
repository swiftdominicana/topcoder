//
//  Repository.swift
//  Repository
//
//  Created by Libranner Leonel Santos Espinal on 22/8/21.
//

import Foundation

struct Repository: Identifiable, Decodable {
  let id: Int64
  let name: String
  let url: URL
  let fork: Bool
}
