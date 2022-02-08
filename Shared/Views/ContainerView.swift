//
//  ContainerView.swift
//  WeighMe
//
//  Created by Boyce Estes on 2/7/22.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        VStack {
            WeightInputView()
            StatisticView()
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
