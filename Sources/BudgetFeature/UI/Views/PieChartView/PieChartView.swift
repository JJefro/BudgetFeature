//
//  PieChartView.swift
//  BudgetFeature
//
//  Created by j.jefrosinins on 18/05/2025.
//

import SwiftUI
import Charts

struct PieChartSliceUIModel: Identifiable {
    var id: UUID = UUID()
    var label: String
    var value: Double
    var color: Color
}

struct PieChartView: View {
    @State private var slices: [PieChartSliceUIModel]
    private let title: String

    init(title: String, amountSpent: Double, budget: Double) {
        self.title = title
        slices = [
            .init(label: "Spent", value: amountSpent, color: .blue),
            .init(label: "Remaining", value: max(budget - amountSpent, 0), color: .gray)
        ]
    }

    var body: some View {
        Chart(slices) { slice in
            SectorMark(angle: .value("Value", slice.value),
                       innerRadius: .ratio(0.6), angularInset: 5)
            .cornerRadius(5)
            .foregroundStyle(by: .value("Label", slice.label))
        }
        .scaledToFit()
        .chartLegend(alignment: .center, spacing: 16)
        .chartBackground { proxy in
            GeometryReader { geometry in
                if let anchor = proxy.plotFrame {
                    let frame = geometry[anchor]
                    buildTitleView()
                        .frame(maxWidth: frame.width / 2)
                        .position(x: frame.midX, y: frame.midY)
                }
            }
        }
    }

    @ViewBuilder
    private func buildTitleView() -> some View {
        Text(title)
            .font(.title.bold())
            .multilineTextAlignment(.center)
    }
}

#Preview {
    PieChartView(title: "Food Budget", amountSpent: 200, budget: 400)
        .frame(height: 300)
}
