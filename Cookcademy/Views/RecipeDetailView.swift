//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 06/06/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            
            HStack {
                Text("\(recipe.mainInformation.description)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            
            List {
                Section(header: Text("Ingredient")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundColor(listTextColor)
                    }.padding()
                }.listRowBackground(listBackgroundColor)
                
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let directions = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold().padding(.trailing)
                            Text("\(directions.isOptional ? "(Optional) " : "")" + "\(directions.description)")
                        }.foregroundColor(listTextColor)
                    }.padding()
                }.listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
  @State static var recipe = Recipe.testRecipes[0]
  static var previews: some View {
    NavigationView {
      RecipeDetailView(recipe: recipe)
    }
  }
}
