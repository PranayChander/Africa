//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by pranay chander on 31/03/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
