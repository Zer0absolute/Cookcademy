//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 07/06/2025.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                Text("Ingredients")
            case .directions:
                Text("Directions")
            }
            Spacer()
        }
    }
    
    enum Selection {
      case main
      case ingredients
      case directions
    }
}

#Preview {
    struct ModifyRecipeView_Previews: View {
        @State var recipe = Recipe()
        var body: some View {
            ModifyRecipeView(recipe: $recipe)
        }
    }
    return ModifyRecipeView_Previews()
}
