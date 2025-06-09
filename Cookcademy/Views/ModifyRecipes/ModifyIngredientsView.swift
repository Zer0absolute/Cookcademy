//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 08/06/2025.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient",
                    destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                        ingredients.append(ingredient)
                        newIngredient = Ingredient()
                    }
                )
                .listRowBackground(listBackgroundColor)
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }.listRowBackground(listBackgroundColor)
                    NavigationLink("Add another ingredient",
                        destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                            ingredients.append(ingredient)
                            newIngredient = Ingredient()
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
  @State static var emptyIngredients = [Ingredient]()
  static var previews: some View {
    NavigationView {
      ModifyIngredientsView(ingredients: $emptyIngredients)
    }
  }
}
