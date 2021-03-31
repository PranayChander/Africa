//
//  ContentView.swift
//  Africa
//
//  Created by pranay chander on 20/03/21.
//

import SwiftUI

struct ContentView: View {

    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        switch gridColumn {
        case 1:
            toolBarIcon = "rectangle.grid.1x2"
        case 2:
            toolBarIcon = "square.grid.2x2"
        case 3:
            toolBarIcon = "square.grid.3x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .padding(.bottom, 16)
                            .frame(height: 300, alignment: .center)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {
                            animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }

                        }

                        CreditsView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, pinnedViews: [], content: {
                            ForEach(animals) {
                                animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)

                                    })
                            }
                            .padding(10)
                            .animation(.easeIn)
                        })
                    })
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center, spacing: 16, content: {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })

                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
