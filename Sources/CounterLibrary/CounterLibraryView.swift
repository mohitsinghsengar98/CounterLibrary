//
//  SwiftUIView.swift
//  CounterLibrary
//
//  Created by Mohit Sengar on 05/10/25.
//

import SwiftUI
import Combine

public class CounterViewModel: ObservableObject {
    @Published public var count = 0

    public init() {}
    
    public func increment() {
        count += 1
    }
    
    public func decrement() {
        count -= 1
    }
    
    public func reset() {
        count = 0
    }
}

public struct CounterLibraryView: View {
    @StateObject private var viewModel = CounterViewModel()

    public init() {}
    
    public var body: some View {
        NavigationStack {
            VStack {
                Text("Count: \(viewModel.count)")
                Button("Increment") {
                    viewModel.increment()
                }
                
                Button("Decrement") {
                    if(viewModel.count>1){
                        viewModel.decrement()
                    }
                }
                
                Button("Reset") {
                    viewModel.reset()
                }
            }
            .padding()
        }.navigationTitle("Counter")
    }
}
