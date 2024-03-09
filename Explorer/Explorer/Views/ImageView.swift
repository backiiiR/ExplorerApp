//
//  ImageView.swift
//  Explorer
//
//  Created by student on 09.03.24.
//

import SwiftUI

struct ImageView: View {
    var image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .shadow(radius: 5)
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundStyle(.gray)
        }
    } // MARK: body End
}

#Preview {
    ImageView()
}

