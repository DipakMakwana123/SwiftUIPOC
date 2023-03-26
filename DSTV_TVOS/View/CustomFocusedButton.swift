//
//  CustomFocusedButton.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 26/01/23.
//

import SwiftUI

struct CustomHButton<Content>: View where Content : View {

    @State private var focused = false
    @State private var pressed = false
    let action: () -> Void
    @ViewBuilder let content: () -> Content

    var body: some View {
        contentView
            .background(focused ? .clear : Color.black.opacity(1))
            .border(focused ? .white : .gray,width: focused ? 5 : 3)
            .cornerRadius(10)
            .scaleEffect(focused ? 1.0 : 1)
            .animation(.none, value: focused)
    }

    var contentView: some View {
#if os(tvOS)
        ZStack {
            ClickableHack(focused: $focused, pressed: $pressed, action: action)
            content()
                .padding(margin8)
                .layoutPriority(1)
        }
#else
        Button(action: action, label: content)
#endif
    }
}
struct CustomButton<Content>: View where Content : View {

    @State private var focused = false
    @State private var pressed = false
    let action: () -> Void
    @ViewBuilder let content: () -> Content


    var body: some View {
        contentView
            .background(focused ? Color.clear : .clear)
            .cornerRadius(20)
            .scaleEffect(focused ? 1 : 1)
           // .animation(.default, value: pressed)

        if focused {
            Divider()
                .frame(height: 10)
                .background(.blue)
        }
    }
    var contentView: some View {
#if os(tvOS)
        ZStack {
            ClickableHack(focused: $focused, pressed: $pressed, action: action)
            content()
                .padding(margin8)
                .layoutPriority(1)
        }
#else
        Button(action: action, label: content)
#endif
    }
}

class DataSource: ObservableObject {
    @Published var focused: Bool = false
}
struct CustomButtonWithDescription<Content>: View where Content: View {

    @State private var focused: Bool = false
    @State private var pressed = false
    let action: () -> Void
    @ViewBuilder let content: () -> Content
    @Binding var item: SettingModel


    var body: some View {
        contentView
            .background(focused ? Color.clear : .clear)
            .cornerRadius(20)
            .scaleEffect(focused ? 1 : 1)
            .onChange(of: focused) { newValue in
                
                self.item.selected = focused
            }
    }
    var contentView: some View {
#if os(tvOS)
        ZStack {
            ClickableHack(focused: $focused, pressed: $pressed, action: action)
            content()
                .padding(margin8)
                .layoutPriority(1)
        }
#else
        Button(action: action, label: content)
#endif
    }
}

class ClickableHackView: UIView {
    weak var delegate: ClickableHackDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressesBegan()
        } else {
            super.pressesBegan(presses, with: event)
        }
    }

    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressesEnded()
        } else {
            super.pressesEnded(presses, with: event)
        }
    }

    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if validatePress(event: event) {
            delegate?.pressesEnded()
        } else {
            super.pressesCancelled(presses, with: event)
        }
    }

    private func validatePress(event: UIPressesEvent?) -> Bool {
        event?.allPresses.map({ $0.type }).contains(.select) ?? false
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegate?.focus(focused: isFocused)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var canBecomeFocused: Bool {
        return true
    }
}

protocol ClickableHackDelegate: AnyObject {
    func focus(focused: Bool)
    func pressesBegan()
    func pressesEnded()
}

struct ClickableHack: UIViewRepresentable {
    @Binding var focused: Bool
    @Binding var pressed: Bool
    let action: () -> Void

    func makeUIView(context: UIViewRepresentableContext<ClickableHack>) -> UIView {
        let clickableView = ClickableHackView()
        clickableView.delegate = context.coordinator
        return clickableView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ClickableHack>) {
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, ClickableHackDelegate {
        private let control: ClickableHack

        init(_ control: ClickableHack) {
            self.control = control
            super.init()
        }

        func focus(focused: Bool) {
            control.focused = focused
        }

        func pressesBegan() {
            control.pressed = true
        }

        func pressesEnded() {
            control.pressed = false
            control.action()
        }
    }
}

