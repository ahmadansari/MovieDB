//
//  DatePickerView.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 05.09.23.
//

import SwiftUI

struct DatePickerView: View {
  @Binding var selectedDate: Date
  @Binding var isPresented: Bool

  var body: some View {
    VStack {
      DatePicker("Date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("Select a Date")
          .font(.headline)
          .foregroundColor(.white)
      }
      ToolbarItem(placement: .confirmationAction) {
        Button(action: {
          isPresented = false
        }) {
          Text("Done")
            .font(.headline)
            .foregroundColor(.white)
        }
      }
    }
  }
}

struct DatePickerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DatePickerView(selectedDate: .constant(Date()), isPresented: .constant(false))
    }
    .presentationDetents([.height(300)])
    .presentationDragIndicator(.automatic)
  }
}
