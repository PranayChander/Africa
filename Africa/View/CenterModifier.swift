//
//  CenterModifier.swift
//  Africa
//
//  Created by pranay chander on 31/03/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
