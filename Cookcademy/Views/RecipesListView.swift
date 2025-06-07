//
//  ContentView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 31/05/2025.
//

import SwiftUI

struct RecipesListView: View {
    @Environment(RecipeData.self) private var recipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .padding()
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    
  private var recipes: [Recipe] {
    recipeData.recipes(for: category)
  }
  
  private var navigationTitle: String {
    "\(category.rawValue) Recipes"
  }
}


struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView(category: .breakfast)
            .environment(RecipeData())

    }
  }
}
