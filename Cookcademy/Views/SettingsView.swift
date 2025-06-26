//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 22/06/2025.
//

import SwiftUI

struct SettingsView: View {
  @AppStorage("hideOptionalStep") private var hideOptionalStep: Bool = false
  @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
  @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
  
  var body: some View {
    NavigationStack {
      Form {
        ColorPicker("List background color", selection: $listBackgroundColor)
          .padding()
          .listRowBackground(listBackgroundColor)
        ColorPicker("Text Color", selection: $listTextColor)
          .padding()
          .listRowBackground(listBackgroundColor)
        Toggle("Hide optional step", isOn: $hideOptionalStep)
          .padding()
          .listRowBackground(listBackgroundColor)
      }
      .foregroundColor(listTextColor)
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  SettingsView()
}
