extension File: Hashable {
    public static func == (lhs: File, rhs: File) -> Bool {
        switch (lhs.path, rhs.path) {
        case let (.some(lhsPath), .some(rhsPath)):
            return lhsPath == rhsPath
        case (.none, .none):
            return lhs.safeContents == rhs.safeContents
        default:
            return false
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(path ?? safeContents)
    }
}
