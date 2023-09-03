import SwiftUI

struct OnboardOneView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            //        2nd VStack
            Image("profile").resizable()
            
            VStack {
                Text("Firstly, this App is FOR YOU.").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.white).padding(.bottom).padding(.horizontal,10).multilineTextAlignment(SwiftUI.TextAlignment.center)
                Text("In today's fast-paced world, it's easy to get swept up in the chaos and demands of life.").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.white).padding(.bottom).padding(.horizontal,10).multilineTextAlignment(SwiftUI.TextAlignment.center)
                Text(" When your heart is at peace, your mind can focus, your body can relax, and your spirit can thrive.").font(.system(size: 16)).fontWeight(.bold).lineSpacing(4).padding(10).foregroundColor(Color.white).padding(.bottom).padding(.horizontal,10).multilineTextAlignment(SwiftUI.TextAlignment.center)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Bluegray900)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct OnboardOneView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardOneView()
    }
}
