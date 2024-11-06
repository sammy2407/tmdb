//
//  MovieCastView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCastView: View {
    let name: String
    let characterName: String
    let profilePath: String
    
    var body: some View {
        VStack(alignment: .center){
            
            WebImage(url: URL(string: profilePath)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 80, height: 100)
            .cornerRadius(8)
            
            Text(name)
                .font(.caption)
                .frame(width: 80)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text(characterName)
                .font(.caption2)
                .frame(width: 80)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary.opacity(0.6))
                .lineLimit(nil)
        }
    }
}

#Preview {
    MovieCastView(name:"Lauren Laverae", characterName: "Elina", profilePath: "")
}
