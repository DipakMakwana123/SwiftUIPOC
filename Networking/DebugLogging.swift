
func debugLog(_ message: String) {
    #if DEBUG
        print(message)
    #endif
}

func debugLog(_ className: String, message: String) {
    #if DEBUG
        print(className + " | " + message)
    #endif
}

func debugLog(_ classType: AnyClass, message: String) {
    #if DEBUG
    let className = String(describing: classType.self)
    print(className + " | " + message)
    #endif
}

func debugLog(_ type: Any, message: String) {
    #if DEBUG
    let typeName = String(describing: type.self)
    print(typeName + " | " + message)
    #endif
}
