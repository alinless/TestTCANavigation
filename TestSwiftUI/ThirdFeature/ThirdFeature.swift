//
//  ThirdFeature.swift
//  TestSwiftUI
//

import ComposableArchitecture
import Foundation

public struct ThirdFeature: ReducerProtocol {

   public struct State: Equatable {
      public init() {

      }
   }

   @Dependency(\.mainQueue) private var mainQueue

   // MARK: - Action
   public enum Action: Equatable {
      case delegate(Delegate)

      public enum Delegate: Equatable {
      }
   }

   public var body: some ReducerProtocolOf<Self> {

      Reduce { state, action in
         switch action {

         case .delegate:
            return .none

         }

      }

   }

}
