//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 07/06/2025.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(name: "Test", description: "Test", author: "Test", category: .breakfast)
            recipe.directions = [Direction(description: "Test", isOptional: false)]
            recipe.ingredients = [Ingredient(name: "Test", quantity: 1.0, unit: .none)]
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
  @State static var recipe = Recipe()
  static var previews: some View {
    ModifyRecipeView(recipe: $recipe)
  }
}
