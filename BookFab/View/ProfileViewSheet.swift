//
//  ProfileViewSheet.swift
//  BookFab
//
//  Created by Nicole Lopez feliz on 2021-02-18.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift



struct ProfileViewSheet: View {
    @EnvironmentObject var currentProfileUser: UserData
    
    @State private var myProcuctsDescription = "Ange en beskrivning på dina produkter"
    @State private var aboutMe = "Ange en kort beskrivning om dig"
    @State private var mySocialMedia = "Ange länk till sociala medier"
    @State var userUidString: String = ""
    @State private var content: String = ""
    @State var businessUserInfo: BusinessUserData? = nil

    var usersCollection = "locationTest"
    var db = Firestore.firestore()
    
    let heightFourth = UIScreen.main.bounds.height/4
    
    private let linkImage = "link"
    private let certefiedTitle = "Certifierad"
    private let myProductsTitle = "Mina Produkter"
    private let aboutMeTitle = "Lite om mig"
    private let socialMediaTitle = "Instagram"
    private let defaultContent = "Ange din vad du är certifierad i..."
    private let editProfileText = "Vill du editera din profil? Gå till din profil under \"Inställningar\""
    private let image = Image(systemName: "heart.text.square")
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Image("nailimage")
                .resizable()
                .frame(height: heightFourth)
                .ignoresSafeArea(edges: .top)
            
            ScrollView {
                
                if let businessUser = currentProfileUser.currUserData?.businessUser {
                    
                    TitleText(
                        title: certefiedTitle, textImage: Image(systemName: "moon.stars"),
                        textContent: businessUser.certifiedIn)
                        .padding(.bottom, 4)
                    
                    TitleText(
                        title: myProductsTitle, textImage: Image(systemName: "wand.and.stars"),
                        textContent: businessUser.productType)
                        .padding(.bottom, 4)
                    
                    TitleText(
                        title: aboutMeTitle, textImage: Image(systemName: "heart.text.square"),
                        textContent: businessUser.aboutMe)
                        .padding(.bottom, 4)
                    
                    TitleText(
                        title: socialMediaTitle, textImage: Image(systemName: "link"),
                        textContent: businessUser.socialMedia)
                        .padding(.bottom, 4)
                    
                    Text(editProfileText)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.all, 15)
                    
                }
            }.frame(height: heightFourth * 3)
        }
    }
    
    private func clearText() {
        if (businessUserInfo == nil) {
            content = ""
        }
    }
    
    private func setContent() {
        if let content = businessUserInfo?.certifiedIn {
            self.content = content
        } else {
            content = defaultContent
        }
        
    }
}
