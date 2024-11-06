//
//  StarView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI

struct StarView: View {
    let rating: Double
    var body: some View {
        VStack{
            singleStarView
                .overlay(
                    GeometryReader{ proxy in
                        let width = (CGFloat(rating) / 10 * proxy.size.width)
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(width: width)
                    }
                ).mask(singleStarView)
        }
    }
    
    private var singleStarView: some View {
        HStack(spacing: 1){
            ForEach(0..<10){ index in
                Image(systemName: Constant.STAR_FILL)
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}

struct Star1_Previews: PreviewProvider {
    static var previews: some View {
        StarView(rating: 4)
    }
}
