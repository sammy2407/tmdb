//
//  SpinnerView.swift
//  TMDb_demo
//
//  Created by Shivam Maheshwari on 06/11/24.
//

import SwiftUI

struct LoaderView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .scaleEffect(2.0, anchor: .center)
    }
}
