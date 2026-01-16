# Advanced Dynamic SQL Builder – Oracle

## Overview
This example demonstrates a real-world **dynamic SQL filtering engine** built on Oracle,
used in a hydrogeological and chemical data system.

The logic dynamically builds SQL queries based on:
- Date ranges
- Chemical properties (EC, PH, ions, minerals)
- GIS coordinates (UTM, Lambert, Geographic)
- Well logging and pumping test data

Originally implemented in a VB6 desktop application connected to Oracle,
this repository extracts and documents the **core SQL logic**.

---

## Key Features
- Complex multi-table joins
- Dynamic WHERE clause construction
- Multiple scientific domains in one query engine
- Oracle-optimized SQL
- GIS and chemical calculations inside SQL

---

## Technologies
- Oracle SQL
- Legacy VB6 (logic reference only)
- Scientific & GIS datasets

---

## Why this matters
This example reflects:
- Real production-level complexity
- Deep understanding of Oracle SQL
- Ability to translate business/scientific rules into efficient queries

---

## Notes
VB6 code is included only as a **logic reference**.
The focus is on SQL design, structure, and data modeling.
