import Foundation


// MARK: - Simplenote API
//
extension NSString {

    /// Returns the line (range, string) at the specified location
    ///
    func line(at location: Int) -> (NSRange, String) {
        let queryRange = NSRange(location: location, length: .zero)
        let resultRange = lineRange(for: queryRange)
        let resultText = substring(with: resultRange)

        return (resultRange, resultText)
    }

    /// Returns the Range of the List Marker in the receiver
    ///
    var rangeOfListMarker: NSRange? {
        return rangeOfAnyPrefix(prefixes: String.listMarkers)
    }

    /// Returns the range of the Prefix contained in the receiver (if any!)
    ///
    func rangeOfAnyPrefix(prefixes: [String]) -> NSRange? {
        let trimmedString = trimmingCharacters(in: .whitespacesAndNewlines)

        for prefix in prefixes where trimmedString.hasPrefix(prefix) {
            return range(of: prefix)
        }

        return nil
    }

    /// Returns the UnicodeScalar at the specified location, if any.
    ///
    /// - Note: For convenience, we'll disregard any `location` that is greater than the receiver's length
    ///
    func unicodeScalar(at location: Int) -> UnicodeScalar? {
        guard location < length else {
            return nil
        }

        return UnicodeScalar(character(at: location))
    }
}
