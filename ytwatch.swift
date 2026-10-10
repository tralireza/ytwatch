import Foundation
import AppKit

let ytp = #/^(https://www\.youtube\.com/watch\?v=|https://youtu\.be/)/#

func executeAction(with url: String) {
    let task = Process()
    
    task.executableURL = URL(fileURLWithPath: "/bin/bash")
    task.arguments = ["-c", "source $HOME/.bash_profile; v \"$1\" &", "--", url]
    
    do {
        try task.run()
        print(". launched function v() for: \(url)")
    } catch {
        print("x failed to run command: \(error.localizedDescription)")
    }
}

func async_executeAction(with url: String) {
    DispatchQueue.global(qos:.utility).async {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        task.arguments = ["-c", "source \"$HOME/.bash_profile\"; v \"$1\"", "--", url]
        
        try? task.run()
        task.waitUntilExit()
    }

    print(". launched function v() for: \(url)")
}

print("--- Swift YouTube Clipboard Monitor Started, monitoring clipboard... press [Ctrl + C] to exit.")

let pb = NSPasteboard.general
var last = pb.changeCount

while true {
    let current = pb.changeCount
    if current != last {
        last = current
        if let text = pb.string(forType: .string)?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if text.contains(ytp) {
                print(". matched YouTube link: \(text)")
                async_executeAction(with: text)
            }
        }
    }

    Thread.sleep(forTimeInterval: 1.25)
}
