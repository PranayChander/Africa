//
//  AnimalListItemView.swift
//  Africa
//
//  Created by pranay chander on 26/03/21.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal: Animal
    var body: some View {
        HStack(alignment: .center, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
            VStack(alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .padding(.trailing, 8)
            })
        })
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        AnimalListItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
