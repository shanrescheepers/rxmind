import SwiftUI

struct OnboardTwoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            //        2nd VStack
            Image("profile").resizable()
            
            VStack {
                Text("When your heart is at peace, your mind can focus, your body can relax, and your spirit can thrive.Remember, it's not selfish to put your well-being first. In fact, it's essential. So, take a deep breath, let go of the stress, and embark on this journey to prioritize your calm heart and goals FIRST.").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.white).padding(.bottom).padding(.horizontal,10).multilineTextAlignment(SwiftUI.TextAlignment.center)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Bluegray900)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}


struct OnboardTwoView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardTwoView()
    }
}
