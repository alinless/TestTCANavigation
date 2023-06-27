//
//  SecondFeature.swift
//  TestSwiftUI
//

import ComposableArchitecture
import Foundation

public struct SecondFeature: ReducerProtocol {

   public struct State: Equatable {

      public init() {

      }
   }

   public enum Action: Equatable {
      case delegate(Delegate)
      case showThird

      public enum Delegate: Equatable {
         case thirdRequested
      }
   }

   public var body: some ReducerProtocolOf<Self> {

      Reduce { state, action in
         switch action {

         case .showThird:
            return .send(.delegate(.thirdRequested))

         case .delegate:
            return .none
         }

      }

   }

}
