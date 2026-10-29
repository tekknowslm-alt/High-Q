# Purchase HSN Summary Implementation & Changes (`HSN_changes.md`)

## 1. Overview
This document tracks all investigations, architectural findings, and modifications for the **Purchase HSN Summary** report under:
`Inv. Report` -> `GST` -> `Purchase HSN` (`/reporting.do?id=800017&title=PurchaseHSNSummary`).

> [!NOTE]
> This document is strictly dedicated to HSN reporting changes and is kept completely separate from `INVOICE_PDF_CHANGES.md`.

---

## 2. Problem Statement
When navigating to `Inv. Report` -> `GST` -> `Purchase HSN Summary`:
1. Selecting a `From Date` and `To Date` and clicking **GO** displays records grouped with hardcoded description `'Fabric'`, rather than describing the actual engineering / hardware goods purchased for **TEKKNOW ENGINEERING COMPANY**.
2. Grouping and table layout should clearly display purchases grouped by HSN code with tax summary metrics (Taxable Value, CGST Amount, SGST Amount, IGST Amount, Total Value) similar to the tax summary feature.

---

## 3. Database Schema & Architecture Analysis

### A. Report Header & Parameters (`report_hdr`, `report_params_config`)
- **Report ID**: `800017`
- **Report Name**: `purchase_hsn_summary`
- **Title**: `Purchase HSN Summary`
- **Current Query in `report_hdr`**:
```sql
SELECT hsn_code AS HSN,
       'Fabric' AS description,
       'PCS-PIECES' AS UQC,
       SUM(total_qty) AS total_qty,
       SUM(total_value + round_off) AS total_value,
       SUM(taxable_value) AS taxable_value,
       SUM(igst_amount) AS igst_amount,
       SUM(cgst_amount) AS cgst_amount,
       SUM(sgst_amount) AS sgst_amount,
       SUM(cess) AS cess
FROM v_purc_hsn_summary v1
WHERE v1.c_code = $(companycode) AND $(fromdate) $(todate)
GROUP BY hsn_code;
```
- **Filter Parameters**:
  - `fromdate`: `date(bill_date) >= '$(fromdate)'`
  - `todate`: `and date(bill_date) <= '$(todate)'`
  - `companycode`: Company ID (1 for `TEKKNOW ENGINEERING COMPANY`)

### B. View Structure (`v_purc_hsn_summary`)
The view `v_purc_hsn_summary` aggregates purchase transactions across:
1. `purc_sale_det` JOIN `purc_sale` (where `tran_type = 'P'`)
2. `purc_inv_det` JOIN `purc_inv` (where `transaction_type = 'B'`)
3. `purc_inv_det` JOIN `purc_inv` (where `transaction_type = 'I'`)
4. `purc_ret_det` JOIN `purc_ret` (Purchase returns subtracted)

### C. Column Definition (`report_dtl` for ID 800017)
| Order | Column Name | Caption | Type | Align | Sum |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | `hsn` | HSN | text | left | 0 |
| 2 | `description` | Description | text | left | 0 |
| 3 | `uqc` | UQC | text | left | 0 |
| 4 | `total_qty` | Total Quantity | decimal | right | 1 |
| 5 | `total_value` | Total Value | decimal | right | 1 |
| 6 | `taxable_value` | Taxable Value | decimal | right | 1 |
| 7 | `igst_amount` | IGST Amount | decimal | right | 1 |
| 8 | `cgst_amount` | CGST Amount | decimal | right | 1 |
| 9 | `sgst_amount` | SGST Amount | decimal | right | 1 |
| 10 | `cess` | Cess | decimal | right | 0 |

---

## 4. Root Cause of the "Fabric" Issue
- The legacy Kannika textile software hardcoded `'Fabric' as description` directly in:
  1. `report_hdr.report_query` for report ID `800017`
  2. Legacy view definitions `v_purchase_hsn_summary`
- In **TEKKNOW ENGINEERING COMPANY**, products are industrial fasteners, tools, and hardware products with designated HSN codes (e.g. `7318`, `8467`, `8205`, `35061000`).

---

## 5. Next Steps for Implementation
1. Update `report_hdr.report_query` (and associated views if necessary) to dynamically resolve the product/item description or HSN description associated with the HSN code rather than `'Fabric'`.
2. Format quantity and tax summary columns to align with TEKKNOW ENGINEERING COMPANY's standard tax summary presentation.
