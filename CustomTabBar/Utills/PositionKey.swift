//
//  PositionKey.swift
//  CustomTabBar
//
//  Created by A'zamjon Abdumuxtorov on 01/03/25.
//


import SwiftUI

struct PositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { geo in
                    let rect = geo.frame(in: .global)
                    Color.clear
                        .preference(key: PositionKey.self, value: rect)
                        .onPreferenceChange(PositionKey.self, perform: completion)
                }
            }
    }
}
