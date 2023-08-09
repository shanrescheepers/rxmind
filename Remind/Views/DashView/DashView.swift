//import SwiftUI
//
//struct DashView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var body: some View {
//        VStack {
//            VStack {
//                VStack(alignment: .trailing, spacing: 0) {
//                    HStack {
//                        VStack {
//                            HStack {
//                                HStack {
//                                    ZStack(alignment: .center) {
//                                        Button(action: {}, label: {
//                                            Image("img_group38")
//                                        })
//                                        .frame(width: getRelativeWidth(47.0),
//                                               height: getRelativeWidth(47.0), alignment: .center)
//                                        .background(RoundedCorners(topLeft: 23.5, topRight: 23.5,
//                                                                   bottomLeft: 23.5,
//                                                                   bottomRight: 23.5)
//                                                .fill(ColorConstants.Bluegray901))
//                                        Button(action: {}, label: {
//                                            Image("img_group39")
//                                        })
//                                        .frame(width: getRelativeWidth(47.0),
//                                               height: getRelativeWidth(47.0), alignment: .center)
//                                        .background(RoundedCorners(topLeft: 23.5, topRight: 23.5,
//                                                                   bottomLeft: 23.5,
//                                                                   bottomRight: 23.5)
//                                                .fill(ColorConstants.Bluegray901))
//                                    }
//                                    .hideNavigationBar()
//                                    .frame(width: getRelativeWidth(48.0),
//                                           height: getRelativeWidth(48.0), alignment: .center)
//                                    Spacer()
//                                    Image("img_maskgroup")
//                                        .resizable()
//                                        .frame(width: getRelativeWidth(141.0),
//                                               height: getRelativeHeight(42.0), alignment: .center)
//                                        .scaledToFit()
//                                        .clipped()
//                                }
//                                .frame(width: getRelativeWidth(264.0),
//                                       height: getRelativeHeight(48.0), alignment: .leading)
//                            }
//                            .frame(width: getRelativeWidth(264.0), height: getRelativeHeight(48.0),
//                                   alignment: .leading)
//                            HStack {
//                                Text(StringConstants.kLblToday)
//                                    .font(FontScheme.kBarlowLight(size: getRelativeHeight(16.0)))
//                                    .fontWeight(.light)
//                                    .foregroundColor(ColorConstants.Bluegray300)
//                                    .minimumScaleFactor(0.5)
//                                    .multilineTextAlignment(.leading)
//                                    .frame(width: getRelativeWidth(46.0),
//                                           height: getRelativeHeight(20.0), alignment: .top)
//                                Spacer()
//                                Text(StringConstants.kLbl23Aug2023)
//                                    .font(FontScheme.kBarlowThin(size: getRelativeHeight(14.0)))
//                                    .fontWeight(.light)
//                                    .foregroundColor(ColorConstants.Bluegray300)
//                                    .minimumScaleFactor(0.5)
//                                    .multilineTextAlignment(.leading)
//                                    .frame(width: getRelativeWidth(75.0),
//                                           height: getRelativeHeight(17.0), alignment: .topLeading)
//                                    .padding(.leading, getRelativeWidth(15.0))
//                            }
//                            .frame(width: getRelativeWidth(236.0), height: getRelativeHeight(20.0),
//                                   alignment: .center)
//                            .padding(.top, getRelativeHeight(33.0))
//                            .padding(.horizontal, getRelativeWidth(0.0))
//
//                            Text(StringConstants.kLblWelcomeShanr)
//                                .font(FontScheme
//                                    .kAveriaSerifLibreBold(size: getRelativeHeight(24.0)))
//                                .fontWeight(.bold)
//                                .foregroundColor(ColorConstants.Gray400)
//                                .minimumScaleFactor(0.5)
//                                .multilineTextAlignment(.leading)
//                                .frame(width: getRelativeWidth(239.0),
//                                       height: getRelativeHeight(30.0), alignment: .topLeading)
//
//
//                        }
//                        .frame(width: getRelativeWidth(264.0), height: getRelativeHeight(142.0),
//                               alignment: .top)
//                        .padding(.vertical, getRelativeHeight(25.0))
//                        Image("img_group14_bluegray_902")
//                            .resizable()
//                            .frame(width: getRelativeWidth(143.0), height: getRelativeHeight(201.0),
//                                   alignment: .center)
//                            .scaledToFit()
//                            .clipped()
//                    }
//                    .frame(width: getRelativeWidth(408.0), height: getRelativeHeight(201.0),
//                           alignment: .trailing)
//                    .padding(.leading)
//                    .padding(.leading)
//                }
//                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(201.0),
//                       alignment: .leading)
//                VStack(alignment: .leading, spacing: 0) {
//                    VStack(alignment: .leading, spacing: 0) {
//                        HStack {
//                            Image("img_group33")
//                                .resizable()
//                                .frame(width: getRelativeWidth(100.0),
//                                       height: getRelativeHeight(96.0), alignment: .center)
//                                .scaledToFit()
//                                .clipped()
//                                .padding(.vertical, getRelativeHeight(21.0))
//                            HStack {
//                                VStack(alignment: .leading, spacing: 0) {
//                                    Text(StringConstants.kLblStressLevels)
//                                        .font(FontScheme
//                                            .kAveriaSerifLibreBold(size: getRelativeHeight(16.0)))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(ColorConstants.Gray500)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(92.0),
//                                               height: getRelativeHeight(20.0),
//                                               alignment: .topLeading)
//                                    Text(StringConstants.kLblLastHrv)
//                                        .font(FontScheme
//                                            .kAveriaSerifLibreBold(size: getRelativeHeight(16.0)))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(ColorConstants.Gray500)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(71.0),
//                                               height: getRelativeHeight(20.0),
//                                               alignment: .topLeading)
//                                        .padding(.trailing, getRelativeWidth(10.0))
//                                    Text(StringConstants.kLblAverage)
//                                        .font(FontScheme
//                                            .kAveriaSerifLibreBold(size: getRelativeHeight(24.0)))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(ColorConstants.Yellow900)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(92.0),
//                                               height: getRelativeHeight(30.0),
//                                               alignment: .topLeading)
//                                        .padding(.top, getRelativeHeight(12.0))
//                                }
//                                .frame(width: getRelativeWidth(92.0),
//                                       height: getRelativeHeight(86.0), alignment: .bottom)
//                                VStack(alignment: .trailing, spacing: 0) {
//                                    HStack {
//                                        Text(StringConstants.kLbl1745)
//                                            .font(FontScheme
//                                                .kAveriaSerifLibreBold(size: getRelativeHeight(13.0)))
//                                            .fontWeight(.bold)
//                                            .foregroundColor(ColorConstants.Gray500)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(30.0),
//                                                   height: getRelativeHeight(16.0),
//                                                   alignment: .topLeading)
//                                        Image("img_arrowright")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(4.0),
//                                                   height: getRelativeHeight(8.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                            .padding(.bottom, getRelativeHeight(4.0))
//                                            .padding(.leading, getRelativeWidth(6.0))
//                                    }
//                                    .frame(width: getRelativeWidth(41.0),
//                                           height: getRelativeHeight(16.0), alignment: .trailing)
//                                    .padding(.leading)
//                                    .padding(.leading)
//                                    .padding(.trailing, getRelativeWidth(4.0))
//                                    HStack {
//                                        Group {
//                                            Spacer()
//                                            ZStack {}
//                                                .hideNavigationBar()
//                                                .frame(width: getRelativeWidth(12.0),
//                                                       height: getRelativeHeight(29.0),
//                                                       alignment: .bottom)
//                                                .background(RoundedCorners(topLeft: 4.0,
//                                                                           topRight: 4.0,
//                                                                           bottomLeft: 4.0,
//                                                                           bottomRight: 4.0)
//                                                        .fill(ColorConstants.Teal300))
//                                                .padding(.top, getRelativeHeight(32.0))
//                                            Spacer()
//                                            ZStack {}
//                                                .hideNavigationBar()
//                                                .frame(width: getRelativeWidth(12.0),
//                                                       height: getRelativeHeight(40.0),
//                                                       alignment: .bottom)
//                                                .background(RoundedCorners(topLeft: 4.0,
//                                                                           topRight: 4.0,
//                                                                           bottomLeft: 4.0,
//                                                                           bottomRight: 4.0)
//                                                        .fill(ColorConstants.Teal300))
//                                                .padding(.top, getRelativeHeight(21.0))
//                                            Spacer()
//                                            ZStack {}
//                                                .hideNavigationBar()
//                                                .frame(width: getRelativeWidth(12.0),
//                                                       height: getRelativeHeight(40.0),
//                                                       alignment: .bottom)
//                                                .background(RoundedCorners(topLeft: 4.0,
//                                                                           topRight: 4.0,
//                                                                           bottomLeft: 4.0,
//                                                                           bottomRight: 4.0)
//                                                        .fill(ColorConstants.Teal300))
//                                                .padding(.top, getRelativeHeight(21.0))
//                                            Spacer()
//                                            ZStack {}
//                                                .hideNavigationBar()
//                                                .frame(width: getRelativeWidth(12.0),
//                                                       height: getRelativeHeight(61.0),
//                                                       alignment: .center)
//                                                .background(RoundedCorners(topLeft: 4.0,
//                                                                           topRight: 4.0,
//                                                                           bottomLeft: 4.0,
//                                                                           bottomRight: 4.0)
//                                                        .fill(ColorConstants.Yellow901))
//                                        }
//                                        Group {
//                                            Spacer()
//                                            ZStack {}
//                                                .hideNavigationBar()
//                                                .frame(width: getRelativeWidth(12.0),
//                                                       height: getRelativeHeight(50.0),
//                                                       alignment: .bottom)
//                                                .background(RoundedCorners(topLeft: 4.0,
//                                                                           topRight: 4.0,
//                                                                           bottomLeft: 4.0,
//                                                                           bottomRight: 4.0)
//                                                        .fill(ColorConstants.Yellow901))
//                                                .padding(.top, getRelativeHeight(11.0))
//                                            Spacer()
//                                        }
//                                    }
//                                    .frame(width: getRelativeWidth(80.0),
//                                           height: getRelativeHeight(61.0), alignment: .leading)
//                                    .padding(.top, getRelativeHeight(27.0))
//                                }
//                                .frame(width: getRelativeWidth(80.0),
//                                       height: getRelativeHeight(104.0), alignment: .top)
//                                .padding(.leading, getRelativeWidth(76.0))
//                            }
//                            .frame(width: getRelativeWidth(249.0), height: getRelativeHeight(111.0),
//                                   alignment: .top)
//                            .padding(.vertical, getRelativeHeight(7.0))
//                            .padding(.leading, getRelativeWidth(8.0))
//                            .padding(.trailing, getRelativeWidth(11.0))
//                        }
//                        .frame(width: getRelativeWidth(376.0), height: getRelativeHeight(147.0),
//                               alignment: .trailing)
//                        .background(RoundedCorners(topLeft: 11.0, topRight: 11.0, bottomLeft: 11.0,
//                                                   bottomRight: 11.0)
//                                .fill(ColorConstants.Black90063))
//                        .padding(.leading, getRelativeWidth(10.0))
//                        HStack {
//                            VStack {
//                                Button(action: {}, label: {
//                                    HStack(spacing: 0) {
//                                        Text(StringConstants.kLblYesterday)
//                                            .font(FontScheme
//                                                .kBarlowRegular(size: getRelativeHeight(14.0)))
//                                            .fontWeight(.regular)
//                                            .padding(.trailing, getRelativeWidth(20.0))
//                                            .padding(.leading, getRelativeWidth(17.0))
//                                            .padding(.vertical, getRelativeHeight(7.0))
//                                            .foregroundColor(ColorConstants.Gray300)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(122.0),
//                                                   height: getRelativeHeight(31.0),
//                                                   alignment: .topLeading)
//                                            .overlay(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                                    bottomLeft: 15.5,
//                                                                    bottomRight: 15.5)
//                                                    .stroke(ColorConstants.Bluegray700,
//                                                            lineWidth: 1))
//                                            .background(RoundedCorners(topLeft: 15.5,
//                                                                       topRight: 15.5,
//                                                                       bottomLeft: 15.5,
//                                                                       bottomRight: 15.5)
//                                                    .fill(Color.clear.opacity(0.7)))
//                                            .shadow(color: ColorConstants.Black9003f, radius: 4,
//                                                    x: 0, y: 4)
//                                    }
//                                })
//                                .frame(width: getRelativeWidth(122.0),
//                                       height: getRelativeHeight(31.0), alignment: .topLeading)
//                                .overlay(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                        bottomLeft: 15.5, bottomRight: 15.5)
//                                        .stroke(ColorConstants.Bluegray700,
//                                                lineWidth: 1))
//                                .background(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                           bottomLeft: 15.5, bottomRight: 15.5)
//                                        .fill(Color.clear.opacity(0.7)))
//                                .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
//                            }
//                            .frame(width: getRelativeWidth(122.0), height: getRelativeHeight(31.0),
//                                   alignment: .center)
//                            .clipShape(Capsule())
//                            Spacer()
//                            VStack {
//                                Button(action: {}, label: {
//                                    HStack(spacing: 0) {
//                                        Text(StringConstants.kLblToday)
//                                            .font(FontScheme
//                                                .kBarlowRegular(size: getRelativeHeight(14.0)))
//                                            .fontWeight(.regular)
//                                            .padding(.horizontal, getRelativeWidth(17.0))
//                                            .padding(.vertical, getRelativeHeight(7.0))
//                                            .foregroundColor(ColorConstants.Gray300)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(81.0),
//                                                   height: getRelativeHeight(31.0),
//                                                   alignment: .topLeading)
//                                            .overlay(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                                    bottomLeft: 15.5,
//                                                                    bottomRight: 15.5)
//                                                    .stroke(ColorConstants.Bluegray700,
//                                                            lineWidth: 1))
//                                            .background(RoundedCorners(topLeft: 15.5,
//                                                                       topRight: 15.5,
//                                                                       bottomLeft: 15.5,
//                                                                       bottomRight: 15.5)
//                                                    .fill(Color.clear.opacity(0.7)))
//                                            .shadow(color: ColorConstants.Black9003f, radius: 4,
//                                                    x: 0, y: 4)
//                                            .padding(.trailing, getRelativeWidth(5.0))
//                                    }
//                                })
//                                .frame(width: getRelativeWidth(81.0),
//                                       height: getRelativeHeight(31.0), alignment: .topLeading)
//                                .overlay(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                        bottomLeft: 15.5, bottomRight: 15.5)
//                                        .stroke(ColorConstants.Bluegray700,
//                                                lineWidth: 1))
//                                .background(RoundedCorners(topLeft: 15.5, topRight: 15.5,
//                                                           bottomLeft: 15.5, bottomRight: 15.5)
//                                        .fill(Color.clear.opacity(0.7)))
//                                .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
//                                .padding(.trailing, getRelativeWidth(5.0))
//                            }
//                            .frame(width: getRelativeWidth(86.0), height: getRelativeHeight(31.0),
//                                   alignment: .center)
//                            .clipShape(Capsule())
//                            .padding(.leading, getRelativeWidth(9.0))
//                        }
//                        .frame(width: getRelativeWidth(217.0), height: getRelativeHeight(31.0),
//                               alignment: .leading)
//                        .padding(.top, getRelativeHeight(51.0))
//                        .padding(.horizontal, getRelativeWidth(29.0))
//                        ZStack(alignment: .topTrailing) {
//                            Image("img_group13_bluegray_904")
//                                .resizable()
//                                .frame(width: getRelativeWidth(168.0),
//                                       height: getRelativeHeight(201.0), alignment: .center)
//                                .scaledToFit()
//                                .clipped()
//                                .padding(.top, getRelativeHeight(280.0))
//                                .padding(.trailing, getRelativeWidth(235.0))
//                            VStack(alignment: .leading, spacing: 10) {
//                                VStack {
//                                    HStack {
//                                        Image("img_group25")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(77.0),
//                                                   height: getRelativeWidth(77.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                            .padding(.vertical, getRelativeHeight(17.0))
//                                            .padding(.leading, getRelativeWidth(20.0))
//                                        Spacer()
//                                        VStack(alignment: .leading, spacing: 0) {
//                                            HStack {
//                                                Text(StringConstants.kLblSteps)
//                                                    .font(FontScheme
//                                                        .kAveriaSerifLibreBold(size: getRelativeHeight(16.0)))
//                                                    .fontWeight(.bold)
//                                                    .foregroundColor(ColorConstants.Gray500)
//                                                    .minimumScaleFactor(0.5)
//                                                    .multilineTextAlignment(.leading)
//                                                    .frame(width: getRelativeWidth(40.0),
//                                                           height: getRelativeHeight(20.0),
//                                                           alignment: .topLeading)
//                                                    .padding(.top, getRelativeHeight(11.0))
//                                                Spacer()
//                                                HStack {
//                                                    Text(StringConstants.kLbl1745)
//                                                        .font(FontScheme
//                                                            .kAveriaSerifLibreBold(size: getRelativeHeight(13.0)))
//                                                        .fontWeight(.bold)
//                                                        .foregroundColor(ColorConstants.Gray500)
//                                                        .minimumScaleFactor(0.5)
//                                                        .multilineTextAlignment(.leading)
//                                                        .frame(width: getRelativeWidth(30.0),
//                                                               height: getRelativeHeight(16.0),
//                                                               alignment: .topLeading)
//                                                    Image("img_arrowright")
//                                                        .resizable()
//                                                        .frame(width: getRelativeWidth(4.0),
//                                                               height: getRelativeHeight(8.0),
//                                                               alignment: .center)
//                                                        .scaledToFit()
//                                                        .clipped()
//                                                        .padding(.leading, getRelativeWidth(6.0))
//                                                }
//                                                .frame(width: getRelativeWidth(41.0),
//                                                       height: getRelativeHeight(16.0),
//                                                       alignment: .top)
//                                                .padding(.bottom, getRelativeHeight(15.0))
//                                            }
//                                            .frame(width: getRelativeWidth(244.0),
//                                                   height: getRelativeHeight(31.0),
//                                                   alignment: .center)
//                                            .padding(.trailing)
//                                            HStack {
//                                                Text(StringConstants.kLbl5555)
//                                                    .font(FontScheme
//                                                        .kAveriaSerifLibreBold(size: getRelativeHeight(24.0)))
//                                                    .fontWeight(.bold)
//                                                    .foregroundColor(ColorConstants.WhiteA700)
//                                                    .minimumScaleFactor(0.5)
//                                                    .multilineTextAlignment(.leading)
//                                                    .frame(width: getRelativeWidth(51.0),
//                                                           height: getRelativeHeight(30.0),
//                                                           alignment: .topLeading)
//                                                    .padding(.top, getRelativeHeight(27.0))
//                                                Spacer()
//                                                HStack {
//                                                    ZStack {}
//                                                        .hideNavigationBar()
//                                                        .frame(width: getRelativeWidth(12.0),
//                                                               height: getRelativeHeight(29.0),
//                                                               alignment: .bottom)
//                                                        .background(RoundedCorners(topLeft: 4.0,
//                                                                                   topRight: 4.0,
//                                                                                   bottomLeft: 4.0,
//                                                                                   bottomRight: 4.0)
//                                                                .fill(ColorConstants.Gray500))
//                                                    ZStack {}
//                                                        .hideNavigationBar()
//                                                        .frame(width: getRelativeWidth(12.0),
//                                                               height: getRelativeHeight(40.0),
//                                                               alignment: .bottom)
//                                                        .background(RoundedCorners(topLeft: 4.0,
//                                                                                   topRight: 4.0,
//                                                                                   bottomLeft: 4.0,
//                                                                                   bottomRight: 4.0)
//                                                                .fill(ColorConstants.Gray500))
//                                                        .padding(.leading, getRelativeWidth(5.0))
//                                                    ZStack {}
//                                                        .hideNavigationBar()
//                                                        .frame(width: getRelativeWidth(12.0),
//                                                               height: getRelativeHeight(40.0),
//                                                               alignment: .bottom)
//                                                        .background(RoundedCorners(topLeft: 4.0,
//                                                                                   topRight: 4.0,
//                                                                                   bottomLeft: 4.0,
//                                                                                   bottomRight: 4.0)
//                                                                .fill(ColorConstants.Gray500))
//                                                        .padding(.leading, getRelativeWidth(5.0))
//                                                    ZStack {}
//                                                        .hideNavigationBar()
//                                                        .frame(width: getRelativeWidth(12.0),
//                                                               height: getRelativeHeight(56.0),
//                                                               alignment: .center)
//                                                        .background(RoundedCorners(topLeft: 4.0,
//                                                                                   topRight: 4.0,
//                                                                                   bottomLeft: 4.0,
//                                                                                   bottomRight: 4.0)
//                                                                .fill(ColorConstants.Gray500))
//                                                        .padding(.leading, getRelativeWidth(5.0))
//                                                    ZStack {}
//                                                        .hideNavigationBar()
//                                                        .frame(width: getRelativeWidth(12.0),
//                                                               height: getRelativeHeight(36.0),
//                                                               alignment: .bottom)
//                                                        .background(RoundedCorners(topLeft: 4.0,
//                                                                                   topRight: 4.0,
//                                                                                   bottomLeft: 4.0,
//                                                                                   bottomRight: 4.0)
//                                                                .fill(ColorConstants.Teal300))
//                                                        .padding(.leading, getRelativeWidth(5.0))
//                                                }
//                                                .frame(width: getRelativeWidth(80.0),
//                                                       height: getRelativeHeight(56.0),
//                                                       alignment: .center)
//                                            }
//                                            .frame(width: getRelativeWidth(249.0),
//                                                   height: getRelativeHeight(57.0),
//                                                   alignment: .leading)
//                                            .padding(.top, getRelativeHeight(4.0))
//                                        }
//                                        .frame(width: getRelativeWidth(249.0),
//                                               height: getRelativeHeight(93.0), alignment: .center)
//                                        .padding(.vertical, getRelativeHeight(6.0))
//                                        .padding(.trailing, getRelativeWidth(9.0))
//                                    }
//                                    .frame(width: getRelativeWidth(376.0),
//                                           height: getRelativeHeight(111.0), alignment: .leading)
//                                    .background(RoundedCorners(topLeft: 11.0, topRight: 11.0,
//                                                               bottomLeft: 11.0, bottomRight: 11.0)
//                                            .fill(ColorConstants.Gray900))
//                                }
//                                .frame(width: getRelativeWidth(376.0),
//                                       height: getRelativeHeight(111.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 11.0, topRight: 11.0,
//                                                           bottomLeft: 11.0, bottomRight: 11.0))
//                                HStack {
//                                    ZStack(alignment: .center) {
//                                        Image("img_group24")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(77.0),
//                                                   height: getRelativeWidth(77.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                        VStack {
//                                            Image("img_vector")
//                                                .resizable()
//                                                .frame(width: getRelativeWidth(32.0),
//                                                       height: getRelativeHeight(11.0),
//                                                       alignment: .center)
//                                                .scaledToFit()
//                                                .clipped()
//                                                .padding(.horizontal, getRelativeWidth(3.0))
//                                            Image("img_vector_white_a702")
//                                                .resizable()
//                                                .frame(width: getRelativeWidth(39.0),
//                                                       height: getRelativeHeight(20.0),
//                                                       alignment: .center)
//                                                .scaledToFit()
//                                                .clipped()
//                                        }
//                                        .frame(width: getRelativeWidth(39.0),
//                                               height: getRelativeHeight(34.0), alignment: .center)
//                                        .padding(.top, getRelativeHeight(21.0))
//                                        .padding(.bottom, getRelativeHeight(22.0))
//                                        .padding(.horizontal, getRelativeWidth(19.0))
//                                    }
//                                    .hideNavigationBar()
//                                    .frame(width: getRelativeWidth(77.0),
//                                           height: getRelativeWidth(77.0), alignment: .center)
//                                    .padding(.vertical, getRelativeHeight(17.0))
//                                    .padding(.leading, getRelativeWidth(20.0))
//                                    Spacer()
//                                    VStack(alignment: .trailing, spacing: 0) {
//                                        HStack {
//                                            Text(StringConstants.kLbl1745)
//                                                .font(FontScheme
//                                                    .kAveriaSerifLibreBold(size: getRelativeHeight(13.0)))
//                                                .fontWeight(.bold)
//                                                .foregroundColor(ColorConstants.Gray500)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.leading)
//                                                .frame(width: getRelativeWidth(30.0),
//                                                       height: getRelativeHeight(16.0),
//                                                       alignment: .topLeading)
//                                            Image("img_arrowright")
//                                                .resizable()
//                                                .frame(width: getRelativeWidth(4.0),
//                                                       height: getRelativeHeight(8.0),
//                                                       alignment: .center)
//                                                .scaledToFit()
//                                                .clipped()
//                                                .padding(.bottom, getRelativeHeight(4.0))
//                                                .padding(.leading, getRelativeWidth(6.0))
//                                        }
//                                        .frame(width: getRelativeWidth(41.0),
//                                               height: getRelativeHeight(16.0),
//                                               alignment: .trailing)
//                                        .padding(.leading)
//                                        .padding(.leading)
//                                        .padding(.trailing, getRelativeWidth(4.0))
//                                        Text(StringConstants.kLblTimeAsleep)
//                                            .font(FontScheme
//                                                .kAveriaSerifLibreBold(size: getRelativeHeight(16.0)))
//                                            .fontWeight(.bold)
//                                            .foregroundColor(ColorConstants.Gray500)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(89.0),
//                                                   height: getRelativeHeight(20.0),
//                                                   alignment: .topLeading)
//                                            .padding(.trailing, getRelativeWidth(159.0))
//                                        HStack {
//                                            Text(StringConstants.kLbl612)
//                                                .font(FontScheme
//                                                    .kAveriaSerifLibreBold(size: getRelativeHeight(24.0)))
//                                                .fontWeight(.bold)
//                                                .foregroundColor(ColorConstants.WhiteA700)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.leading)
//                                                .frame(width: getRelativeWidth(44.0),
//                                                       height: getRelativeHeight(30.0),
//                                                       alignment: .topLeading)
//                                                .padding(.top, getRelativeHeight(26.0))
//                                            Spacer()
//                                            HStack {
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(29.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(40.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(40.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(56.0),
//                                                           alignment: .center)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(50.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Teal300))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                            }
//                                            .frame(width: getRelativeWidth(80.0),
//                                                   height: getRelativeHeight(56.0),
//                                                   alignment: .center)
//                                        }
//                                        .frame(width: getRelativeWidth(249.0),
//                                               height: getRelativeHeight(56.0), alignment: .leading)
//                                    }
//                                    .frame(width: getRelativeWidth(249.0),
//                                           height: getRelativeHeight(92.0), alignment: .top)
//                                    .padding(.vertical, getRelativeHeight(6.0))
//                                    .padding(.trailing, getRelativeWidth(9.0))
//                                }
//                                .frame(width: getRelativeWidth(376.0),
//                                       height: getRelativeHeight(111.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 11.0, topRight: 11.0,
//                                                           bottomLeft: 11.0, bottomRight: 11.0)
//                                        .fill(ColorConstants.Gray900))
//                                .padding(.top, getRelativeHeight(21.0))
//                                HStack {
//                                    ZStack(alignment: .center) {
//                                        Image("img_group27")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(77.0),
//                                                   height: getRelativeWidth(77.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                        Button(action: {}, label: {
//                                            Image("img_group28")
//                                        })
//                                        .frame(width: getRelativeWidth(64.0),
//                                               height: getRelativeWidth(64.0), alignment: .center)
//                                        .background(RoundedCorners(topLeft: 32.0, topRight: 32.0,
//                                                                   bottomLeft: 32.0,
//                                                                   bottomRight: 32.0)
//                                                .fill(ColorConstants.Pink600))
//                                        .padding(.top, getRelativeHeight(7.0))
//                                        .padding(.bottom, getRelativeHeight(6.0))
//                                        .padding(.horizontal, getRelativeWidth(7.0))
//                                    }
//                                    .hideNavigationBar()
//                                    .frame(width: getRelativeWidth(77.0),
//                                           height: getRelativeWidth(77.0), alignment: .center)
//                                    .padding(.vertical, getRelativeHeight(17.0))
//                                    .padding(.leading, getRelativeWidth(20.0))
//                                    Spacer()
//                                    VStack(alignment: .leading, spacing: 0) {
//                                        HStack {
//                                            Text(StringConstants.kLblLatest)
//                                                .font(FontScheme
//                                                    .kAveriaSerifLibreBold(size: getRelativeHeight(16.0)))
//                                                .fontWeight(.bold)
//                                                .foregroundColor(ColorConstants.Gray500)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.leading)
//                                                .frame(width: getRelativeWidth(46.0),
//                                                       height: getRelativeHeight(20.0),
//                                                       alignment: .topLeading)
//                                                .padding(.top, getRelativeHeight(9.0))
//                                            Spacer()
//                                            HStack {
//                                                Text(StringConstants.kLbl1745)
//                                                    .font(FontScheme
//                                                        .kAveriaSerifLibreBold(size: getRelativeHeight(13.0)))
//                                                    .fontWeight(.bold)
//                                                    .foregroundColor(ColorConstants.Gray500)
//                                                    .minimumScaleFactor(0.5)
//                                                    .multilineTextAlignment(.leading)
//                                                    .frame(width: getRelativeWidth(30.0),
//                                                           height: getRelativeHeight(16.0),
//                                                           alignment: .topLeading)
//                                                Image("img_arrowright")
//                                                    .resizable()
//                                                    .frame(width: getRelativeWidth(4.0),
//                                                           height: getRelativeHeight(8.0),
//                                                           alignment: .center)
//                                                    .scaledToFit()
//                                                    .clipped()
//                                                    .padding(.leading, getRelativeWidth(6.0))
//                                            }
//                                            .frame(width: getRelativeWidth(41.0),
//                                                   height: getRelativeHeight(16.0), alignment: .top)
//                                            .padding(.bottom, getRelativeHeight(13.0))
//                                        }
//                                        .frame(width: getRelativeWidth(244.0),
//                                               height: getRelativeHeight(29.0), alignment: .center)
//                                        .padding(.trailing)
//                                        HStack {
//                                            HStack {
//                                                Text(StringConstants.kLbl69)
//                                                    .font(FontScheme
//                                                        .kAveriaSerifLibreBold(size: getRelativeHeight(24.0)))
//                                                    .fontWeight(.bold)
//                                                    .foregroundColor(ColorConstants.WhiteA700)
//                                                    .minimumScaleFactor(0.5)
//                                                    .multilineTextAlignment(.leading)
//                                                    .frame(width: getRelativeWidth(26.0),
//                                                           height: getRelativeHeight(30.0),
//                                                           alignment: .topLeading)
//                                                Text(StringConstants.kLblBpm)
//                                                    .font(FontScheme
//                                                        .kAveriaSerifLibreBold(size: getRelativeHeight(13.0)))
//                                                    .fontWeight(.bold)
//                                                    .foregroundColor(ColorConstants.Gray500)
//                                                    .minimumScaleFactor(0.5)
//                                                    .multilineTextAlignment(.leading)
//                                                    .frame(width: getRelativeWidth(29.0),
//                                                           height: getRelativeHeight(16.0),
//                                                           alignment: .topLeading)
//                                                    .padding(.leading, getRelativeWidth(31.0))
//                                            }
//                                            .frame(width: getRelativeWidth(87.0),
//                                                   height: getRelativeHeight(30.0),
//                                                   alignment: .bottom)
//                                            .padding(.vertical, getRelativeHeight(25.0))
//                                            Spacer()
//                                            HStack {
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(29.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(40.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(40.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(56.0),
//                                                           alignment: .center)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Gray500))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                                ZStack {}
//                                                    .hideNavigationBar()
//                                                    .frame(width: getRelativeWidth(12.0),
//                                                           height: getRelativeHeight(36.0),
//                                                           alignment: .bottom)
//                                                    .background(RoundedCorners(topLeft: 4.0,
//                                                                               topRight: 4.0,
//                                                                               bottomLeft: 4.0,
//                                                                               bottomRight: 4.0)
//                                                            .fill(ColorConstants.Teal300))
//                                                    .padding(.leading, getRelativeWidth(5.0))
//                                            }
//                                            .frame(width: getRelativeWidth(80.0),
//                                                   height: getRelativeHeight(56.0),
//                                                   alignment: .center)
//                                        }
//                                        .frame(width: getRelativeWidth(249.0),
//                                               height: getRelativeHeight(56.0), alignment: .leading)
//                                        .padding(.top, getRelativeHeight(6.0))
//                                    }
//                                    .frame(width: getRelativeWidth(249.0),
//                                           height: getRelativeHeight(92.0), alignment: .top)
//                                    .padding(.vertical, getRelativeHeight(6.0))
//                                    .padding(.trailing, getRelativeWidth(9.0))
//                                }
//                                .frame(width: getRelativeWidth(376.0),
//                                       height: getRelativeHeight(111.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 11.0, topRight: 11.0,
//                                                           bottomLeft: 11.0, bottomRight: 11.0)
//                                        .fill(ColorConstants.Gray900))
//                                .padding(.top, getRelativeHeight(21.0))
//                            }
//                            .frame(width: getRelativeWidth(376.0), height: getRelativeHeight(375.0),
//                                   alignment: .topTrailing)
//                            .padding(.bottom, getRelativeHeight(106.0))
//                            .padding(.leading, getRelativeWidth(27.0))
//                        }
//                        .hideNavigationBar()
//                        .frame(width: getRelativeWidth(403.0), height: getRelativeHeight(481.0),
//                               alignment: .center)
//                        .padding(.top, getRelativeHeight(11.0))
//                    }
//                    .frame(width: getRelativeWidth(405.0), height: getRelativeHeight(721.0),
//                           alignment: .leading)
//                    .background(ColorConstants.Bluegray900)
//                    .padding(.trailing)
//                }
//                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(721.0),
//                       alignment: .leading)
//                .padding(.top, getRelativeHeight(10.0))
//            }
//            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
//            .background(ColorConstants.Bluegray900)
//            .padding(.top, getRelativeHeight(30.0))
//            .padding(.bottom, getRelativeHeight(10.0))
//        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        .background(ColorConstants.Bluegray900)
//        .ignoresSafeArea()
//        .hideNavigationBar()
//    }
//}
//
//struct DashView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashView()
//    }
//}
