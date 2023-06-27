//
//  TestSwiftUIApp.swift
//  TestSwiftUI
//

import ComposableArchitecture
import SwiftUI

@main
struct TestSwiftUIApp: App {

   @UIApplicationDelegateAdaptor(AppDelegate.self)
   private var appDelegate

   var body: some Scene {
      WindowGroup {
         FirstView(store: self.appDelegate.store)
      }
   }
}

final class AppDelegate: NSObject, UIApplicationDelegate {

   let store = Store(
      initialState: .init(),
      reducer: FirstFeature()
   )

   lazy var viewStore = ViewStore(
      self.store.scope(state: { _ in () }, action: { $0 }),
      observe: { $0 },
      removeDuplicates: ==
   )

   func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
   ) -> Bool {
      return true

   }

}
