//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 22/06/2025.
//

import SwiftUI

struct MainTabView: View {
  @State var recipeData = RecipeData()
  
  var body: some View {
    TabView {
      Tab("Recipes", systemImage: "list.dash") {
        RecipeCategoryGridView()
      }
      
      Tab("Favorite", systemImage: "heart.fill") {
        RecipesListView(viewStyle: .favorites)
      }
      
      Tab("Settings", systemImage: "gear") {
        SettingsView()
      }
    }
    .environment(recipeData)
    .onAppear {
      recipeData.loadRecipes()
      }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
