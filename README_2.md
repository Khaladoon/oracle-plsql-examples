# Groundwater Decision Support Query Engine (Oracle SQL)

## Overview
This case study presents an advanced Oracle SQL–based decision support engine
designed to query, filter, and analyze large-scale groundwater databases.

The system was developed to support hydrological, hydrogeological, geological,
and geochemical decision-making across multiple river basins and regions.

Although originally integrated into a legacy VB6 application, this repository
focuses exclusively on the **database logic and SQL design**, independent of any UI technology.

---

## Problem Domain
Groundwater databases contain highly heterogeneous data, including:
- Geological and lithological descriptions
- Well construction details
- Pumping test results
- Periodical monitoring measurements
- Chemical, isotopic, and physical parameters

Decision-makers often need to apply **complex combinations of scientific criteria**
to identify relevant wells or monitoring sites.

---

## Technical Approach
The system implements a **dynamic SQL filtering architecture** based on:

- Progressive subquery filtering using a shared key (`WPN`)
- Domain-specific SQL modules (geology, geophysics, chemistry, hydraulics)
- Advanced boolean logic (AND / OR / HAVING)
- Performance-aware query design suitable for large datasets

Each scientific domain produces a filtered set of `WPN` values,
which are then intersected to generate the final result set.

---

## Key Features
- Advanced Oracle SQL and PL/SQL logic
- Modular scientific filtering
- Cross-domain data integration
- Scalable design for large groundwater databases
- Designed for decision support, not simple CRUD operations

---

## Scientific Domains Covered
- Lithology and geological age
- Paleontology
- Geophysical well logging
- Well construction and casing
- Pumping tests and aquifer parameters
- Periodical monitoring data
- Groundwater exploitation data

---

## Intended Audience
- Senior Database Developers
- Oracle Developers / DBAs
- Data Engineers
- Scientific Information System Architects

---

## Notes
All SQL examples provided here are extracted and refactored
from real-world production systems used in regional water resource studies.
