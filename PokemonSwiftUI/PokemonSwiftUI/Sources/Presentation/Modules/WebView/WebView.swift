import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {
    public class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
    }

    let url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView(frame: .zero, configuration: .init())
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        if let url = url {
            webView.load(.init(url: url))
        }
        return webView
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }

    public func makeCoordinator() -> Coordinator {
        .init()
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: nil)
    }
}
