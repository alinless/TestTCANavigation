//
//  ThirdView.swift
//  TestSwiftUI
//

import ComposableArchitecture
import SwiftUI

public struct ThirdView: View {

   var store: StoreOf<ThirdFeature>

   public init(store: StoreOf<ThirdFeature>) {
      self.store = store
   }

   public var body: some View {
      ZStack {
         Color.yellow.ignoresSafeArea()
         WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("ThirdView")
         }
      }
   }
}

// MARK: - Preview
struct ThirdView_Previews: PreviewProvider {
   static var previews: some View {
      ThirdView(
         store: .init(
            initialState: .init(),
            reducer: ThirdFeature()
         )
      )
   }
}
