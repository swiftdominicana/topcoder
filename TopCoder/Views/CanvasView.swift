//
//  CanvasView.swift
//  CanvasView
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import SwiftUI

struct CanvasView: View {
  var body: some View {
    TimelineView(.periodic(from: .now, by: 1.0)) { _ in
      let radius1 = Double.random(in: 40..<150)
      let radius2 = Double.random(in: 40..<150)
      let radius3 = Double.random(in: 40..<150)
      Canvas { context, size in
        context.stroke(
          Path(ellipseIn: CGRect(origin: CGPoint(x: size.width / 2, y: size.height / 2), size: CGSize(width: radius1, height: radius1))),
                with: .color(.green),
                lineWidth: 2)

        context.stroke(
          Path(ellipseIn: CGRect(origin: CGPoint(x: size.width / 4, y: size.height / 4), size: CGSize(width: radius2, height: radius2))),
                with: .color(.red),
                lineWidth: 2)

        context.stroke(
          Path(ellipseIn: CGRect(origin: CGPoint(x: size.width / 3, y: size.height / 3), size: CGSize(width: radius3, height: radius3))),
                with: .color(.yellow),
                lineWidth: 2)
      }
      .frame(width: 300, height: 300)
      .border(Color.teal)
    }
  }
}

struct CanvasView_Previews: PreviewProvider {
  static var previews: some View {
    CanvasView()
  }
}
