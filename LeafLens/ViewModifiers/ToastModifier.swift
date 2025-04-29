//
//  ToastModifier.swift
//  LeafLens
//
//  Created by William German on 4/26/25.
//
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let backgroundColor: Color
    let textColor: Color
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isPresented {
                        Text(message)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundColor)
                            .foregroundColor(textColor)
                            .cornerRadius(15)
                            .padding(.bottom, 50)
                            .padding(.horizontal, 10)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                    withAnimation(.easeInOut(duration: 1)){
                                        isPresented = false
                                    }
                                }
                            }
                            .ignoresSafeArea()
                    }
                },
                alignment: .bottom
            )
            .animation(.easeInOut(duration: 0.25), value: isPresented)
    }
}


extension View {
    func showToast(
        isPresented: Binding<Bool>,
        message: String,
        backgroundColor: Color = .blue,
        textColor: Color = .white,
        duration: TimeInterval = 3
    ) -> some View {
        self.modifier(ToastModifier(
            isPresented: isPresented,
            message: message,
            backgroundColor: backgroundColor,
            textColor: textColor,
            duration: duration
        ))
    }
}

#Preview {
    Color(.secondarySystemBackground)
        .ignoresSafeArea()
        .modifier(
            ToastModifier(
                isPresented: .constant(true),
                message: "Hello World!",
                backgroundColor: .blue,
                textColor: .white,
                duration: 3
            )
        )
}
