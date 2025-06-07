//
//  ContentView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 31/05/2025.
//

import SwiftUI

struct RecipesListView: View {
    @State var recipeData = RecipeData()
    
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
  var recipes: [Recipe] {
    recipeData.recipes
  }
  
  var navigationTitle: String {
    "All Recipes"
  }
}


struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView()
    }
  }
}
