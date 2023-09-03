import SwiftUI

struct OnboardThreeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            //        2nd VStack
            Image("profile").resizable()
            
            VStack {
                Text("Control your narrative, day by day, week by week. It starts with a balanced heart and mind.").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.white).padding(.bottom).padding(.horizontal,10).multilineTextAlignment(SwiftUI.TextAlignment.center)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Bluegray900)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct OnboardThreeView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardThreeView()
    }
}
