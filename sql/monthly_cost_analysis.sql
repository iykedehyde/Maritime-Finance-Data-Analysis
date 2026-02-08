-- Sample SQL query using anonymised and fictional data
-- Demonstrates maritime finance and controlling analysis
-- Data below is for illustration purposes only

WITH vessel_costs AS (
    SELECT * FROM (VALUES
        ('MV Iyke Trader', 'Bunkers', 125000, DATE '2026-01-15'),
        ('MV Iyke Trader', 'Port Charges', 42000, DATE '2026-01-18'),
        ('MV Iyke Trader', 'Repairs & Maintenance', 18000, DATE '2026-01-22'),

        ('MV Amadi Pioneer', 'Bunkers', 98000, DATE '2026-01-10'),
        ('MV Amadi Pioneer', 'Port Charges', 36500, DATE '2026-01-14'),
        ('MV Amadi Pioneer', 'Crew Costs', 52000, DATE '2026-01-31'),

        ('MV Elbe Express', 'Bunkers', 110500, DATE '2026-02-08'),
        ('MV Elbe Express', 'Port Charges', 39800, DATE '2026-02-11'),
        ('MV Elbe Express', 'Charter Hire', 145000, DATE '2026-02-01'),

        ('MV North Sea Feeder', 'Bunkers', 87000, DATE '2026-02-12'),
        ('MV North Sea Feeder', 'Repairs & Maintenance', 26500, DATE '2026-02-20'),
        ('MV North Sea Feeder', 'Crew Costs', 48000, DATE '2026-02-28')
    ) AS t(vessel_name, cost_category, cost_amount, posting_date)
)

SELECT
    vessel_name,
    cost_category,
    DATE_TRUNC('month', posting_date) AS month,
    SUM(cost_amount) AS total_cost
FROM vessel_costs
GROUP BY
    vessel_name,
    cost_category,
    DATE_TRUNC('month', posting_date)
ORDER BY
    month,
    vessel_name,
    total_cost DESC;
