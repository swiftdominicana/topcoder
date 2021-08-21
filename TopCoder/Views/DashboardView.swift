//
//  DashboardView.swift
//  DashboardView
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import SwiftUI

struct DashboardView: View {
  var body: some View {
    TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) { context in
      Text("\(context.date)")
    }
  }
}

struct DashboardView_Previews: PreviewProvider {
  static var previews: some View {
    DashboardView()
  }
}
