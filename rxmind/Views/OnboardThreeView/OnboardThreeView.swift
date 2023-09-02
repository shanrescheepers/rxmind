import SwiftUI

struct OnboardThreeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack {
                        HStack {
                            Image("img_maskgroup")
                                .resizable()
                                .frame(width: getRelativeWidth(141.0),
                                       height: getRelativeHeight(42.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.vertical, getRelativeHeight(28.0))
                            Spacer()
                            Image("img_group14")
                                .resizable()
                                .frame(width: getRelativeWidth(143.0),
                                       height: getRelativeHeight(201.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                        }
                        .frame(width: getRelativeWidth(285.0), height: getRelativeHeight(201.0),
                               alignment: .trailing)
                        .padding(.leading, getRelativeWidth(10.0))
                        Image("img_group_white_a700_87x293")
                            .resizable()
                            .frame(width: getRelativeWidth(293.0), height: getRelativeHeight(87.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.top, getRelativeHeight(122.0))
                            .padding(.trailing, getRelativeWidth(10.0))
                    }
                    .frame(width: getRelativeWidth(361.0), height: getRelativeHeight(411.0),
                           alignment: .trailing)
                    .padding(.leading, getRelativeWidth(10.0))
                    Divider()
                        .frame(width: getRelativeWidth(355.0), height: getRelativeHeight(1.0),
                               alignment: .center)
                        .background(ColorConstants.Gray700)
                        .padding(.top, getRelativeHeight(10.0))
                        .padding(.horizontal, getRelativeWidth(10.0))
                    Text(StringConstants.kMsgFindPeaceInT)
                        .font(FontScheme.kAveriaSerifLibreRegular(size: getRelativeHeight(26.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Gray701)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(301.0), height: getRelativeHeight(32.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(22.0))
                        .padding(.horizontal, getRelativeWidth(10.0))
                    Text(StringConstants.kMsgWitnessYourGr)
                        .font(FontScheme.kBarlowRegular(size: getRelativeHeight(24.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray100)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .frame(width: getRelativeWidth(311.0), height: getRelativeHeight(144.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(32.0))
                        .padding(.horizontal, getRelativeWidth(10.0))
                    Image("img_group13")
                        .resizable()
                        .frame(width: getRelativeWidth(168.0), height: getRelativeHeight(201.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.top, getRelativeHeight(77.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .topLeading)
                .background(ColorConstants.Bluegray900)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.Bluegray900)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
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
