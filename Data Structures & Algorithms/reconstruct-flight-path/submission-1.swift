class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        if tickets.isEmpty {
            return []
        }
        var sTickets = tickets.sorted { $0[1] > $1[1] }
        var adj = [String: [String]]()
        for ticket in sTickets {
            let from = ticket[0]
            let to = ticket[1]
            adj[from, default: []].append(to)
        } 
        var result = [String]()
        dfs(&adj, &result, "JFK")
        return result.reversed()
    }

    func dfs(_ adj: inout [String: [String]],
             _ result: inout [String],
             _ ticket: String) {
        if adj[ticket] != nil {
            while !adj[ticket]!.isEmpty {
                dfs(&adj, &result, adj[ticket]!.removeLast())
            }
        }
        result.append(ticket)
    }
}
