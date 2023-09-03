import SwiftUI

struct Profile: View {
    @State private var isAuthenticationEnabled = UserDefaults.standard.bool(forKey: "isAuthenticationEnabled")

    var body: some View {
        VStack {
            Toggle("Enable Authentication", isOn: $isAuthenticationEnabled)
                .padding()
                .onChange(of: isAuthenticationEnabled, perform: { newValue in
                    UserDefaults.standard.set(newValue, forKey: "isAuthenticationEnabled")
                })

            Spacer()
        }
        .navigationBarTitle("Profile")
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
