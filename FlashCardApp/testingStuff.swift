import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, World!")
            }
            .navigationTitle("Test View")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Test button clicked")
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TestView()
}
