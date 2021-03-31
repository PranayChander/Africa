//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by pranay chander on 27/03/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
        }
    }
}
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
