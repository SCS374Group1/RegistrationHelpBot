//
//  NeedsAttention.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 4/12/23.
//

import SwiftUI

struct NeedsAttention: View {
    @State private var messages = ""
    var body: some View {
        List {
            Text(getRecentFeedback(inputText3: messages))
        }
    }
}

struct NeedsAttention_Previews: PreviewProvider {
    static var previews: some View {
        NeedsAttention()
    }
}
