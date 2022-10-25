//
//  PauseLabelView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 24/10/22.
//

import Foundation
import SwiftUI

struct PauseLabelView : View {
    
    var body: some View {
        
        HStack(spacing: 18.0){
            Image(systemName: "pause.fill")
                .resizable()
                .frame(width: 34,height: 35)
                .scaledToFit()
            Text("Pause")
                .font(.system(size: 36, weight: .regular, design: .rounded))
            
        }
        .padding()
    }
}

