//
//  PrimaryHurdButton.swift
//  Hurd
//
//  Created by clydies freeman on 12/27/22.
//

import SwiftUI

struct PrimaryHurdButton: View {
    let buttonModel: HurdButtonModel
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            ZStack {
                HStack {
                    Text(buttonModel.buttonText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor((buttonModel.buttonType == .primary) ? .white : Color.bottleGreen)
                    
                }
                .frame(maxWidth: .infinity) // Added this to make the entire HStack clickable
                // Otherwise only the Text is tappable
                
                if buttonModel.icon != nil {
                    HStack {
                        if buttonModel.appendingIcon ?? false {
                            Spacer()
                            Image(HurdIcon.arrowRight.rawValue)
                                .frame(width: 20, height: 20)
                                .padding((buttonModel.appendingIcon ?? false) ? .trailing : .leading, 20)
                                
                        } else {
                            Image(HurdIcon.arrowLeft.rawValue)
                                .frame(width: 20, height: 20)
                                .padding((buttonModel.appendingIcon ?? false) ? .trailing : .leading, 20)
                            Spacer()
                        }
                    }
                }
            }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Capsule().foregroundColor(buttonModel.buttonType == .primary ? Color.bottleGreen : .white))
        .background(Capsule().stroke((buttonModel.buttonType == .primary ? .clear : Color.bottleGreen), lineWidth: 3))
     
    }
}

struct PrimaryHurdButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Primary")
            PrimaryHurdButton(buttonModel: HurdButtonModel.mockPrimaryButtonWithAppendingIcon,
                              action: {})
                .padding()

            PrimaryHurdButton(buttonModel: HurdButtonModel.mockPrimaryButton, action: {})
                .padding()

            PrimaryHurdButton(buttonModel: HurdButtonModel.mockPrimaryButtonWithPrependingIcon, action: {})
                .padding()

            Text("Secondary")
            PrimaryHurdButton(buttonModel: HurdButtonModel.mockSecondaryButtonWithAppendingIcon, action: {})
                .padding()

            PrimaryHurdButton(buttonModel: HurdButtonModel.mockSecondaryButton, action: {})
                .padding()

            PrimaryHurdButton(buttonModel: HurdButtonModel.mockSecondaryButtonWithPrependingIcon, action: {})
                .padding()
        }
    }
}
