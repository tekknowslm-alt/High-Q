# Tekknow Engineering Company - Invoice PDF Implementation Guide

## 1. Overview
This document details the final PDF layout architecture and technical modifications implemented for Tekknow Engineering Company across all three invoice generation servlets:
- `WritePDFImpl.java` (`/tekknow/service/invoice/invoiceprint`) - Original Invoice
- `WriteDuplicate.java` (`/tekknow/service/invoice/duplicateprint`) - Duplicate Copy
- `WriteTrans.java` (`/tekknow/service/invoice/transportprint`) - Transport Copy

The implementation faithfully matches the client's original invoice layout with optimized spatial economy:
- **Reference Layout**: `Sample_screen/Adobe Scan May 09, 2026 (1).pdf` (Original Client Scan)
- **Tax Summary Integration**: `Sample_screen/Tax_summary_image.png` (integrated side-by-side occupying the left 3/4 column, with Taxable Value & Taxes occupying the right 1/4 column)
- **Rearrangement & Zero Dead Space**:
  1. `Rupees <Words> Only.` and `Net Amount: <Value>` moved into a prominent totals row **ABOVE** Bank Details & Notes (directly under the Tax Summary & Taxes breakdown).
  2. `Notes:` kept down at the bottom of the Bank Details block below the IFSC Code.
  3. Dynamic calculation of table height (`typ`) based on exact HSN count, eliminating all dead white space.

---

## 2. Component Architecture & Visual Layout

### A. Line Items Table (8 Columns matching Client Scan)
Allocates 100% of printable width (`575.28 pt`):

| Column Name | Caption | Width % | Alignment | Field Source / Description |
| :--- | :--- | :--- | :--- | :--- |
| `sd_sno` | `SNo` | 5.0% | Center | Row counter (`@rowno:=@rowno+1`) |
| `itemdescription` | `Description` | 45.0% | Left | `product_mast.product_name` (+ description if present) |
| `hsncode` | `HSN` | 8.0% | Center | `product_mast.hsn_code` |
| `quantity` | `Qty` | 6.0% | Center | `f_invoice_det.pcs` (decimal formatting preserved) |
| `rate` | `Rate` | 10.0% | Right | `f_invoice_det.rate` (widened to accommodate large numbers) |
| `spl_disc` | `Dis%` | 6.0% | Right | `f_invoice_det.spl_disc` (decimal formatting preserved) |
| `unit` | `Unit` | 7.0% | Center | `unit_mast.unit_name` |
| `amount` | `Amount` | 12.0% + 2pt | Right | `f_invoice_det.amount` |

- **No HSN Grouping in Line Items**: Each item in `f_invoice_det` renders as an individual row without grouping, even when items share the same HSN code.
- **`E. & O.E. Total` Row**: Displays `E. & O.E.` / `Total`, aggregate `Qty`, and aggregate `Amount`.

---

## 3. Lower Section Layout Hierarchy (Zero Dead Whitespace)

Directly below the line items table, the lower section is divided into three tightly packed rows followed by the jurisdiction footer:

```
+-------------------------------------------------------------+------------------------------------+
| Tax Summary:                                                | Taxable Value                 32.80|
| +----------+---------------+---------+---------+-----------+                                    |
| | HSN/ SAC | Taxable amount|  CGST   |  SGST   | Total Tax |                                    |
| |          |     (Rs.)     |Rate  Amt|Rate  Amt|   (Rs.)   |                                    |
| +----------+---------------+---------+---------+-----------+                                    |
| | 7318     |         12.00 | 9.0 1.08| 9.0 1.08|      2.16 |  CGST @ 9.00%                  2.95|
| | 8205     |         20.80 | 9.0 1.87| 9.0 1.87|      3.74 |  SGST @ 9.00%                  2.95|
| +----------+---------------+---------+---------+-----------+                                    |
| | TOTAL    |         32.80 |     2.95|     2.95|      5.90 |  SGST @ 9.00%                  2.95|
+-------------------------------------------------------------+------------------------------------+
| Rupees Thirty Nine Only.                                    | Net Amount:                   39.00|
+-------------------------------------------------------------+------------------------------------+
| Bank Name  : BANK OF BARODA                                 |   For TEKKNOW ENGINEERING COMPANY  |
| A/c No.    : 06080200000494                                 |                                    |
| IFSC Code  : BARB0SALEMX, Branch: Salem Main                |                                    |
| Notes:                                                      |        Authorized Signatory        |
+-------------------------------------------------------------+------------------------------------+
|    Goods once sold cannot be taken back or exchanged.       |    Subject to Salem Jurisdiction.  |
```

### Row 1: Tax Summary (Left 3/4) + Taxable Value & Taxes (Right 1/4)
- **Top**: `typ` (dynamically calculated as `110.0F + taxSectionHeight`, where `taxSectionHeight = Math.max(47.0F + (hsnCount * 13.0F), rightHeight)`).
- **Bottom**: `110.0F`.
- **Left Column (3/4 Width, ~425.7 pt)**:
  - `Tax Summary:` table with HSN rows and `TOTAL` row ending cleanly at `110.0F`.
- **Right Column (1/4 Width, ~149.5 pt)**:
  - `Taxable Value` (gross amount)
  - `Discount` (if applicable)
  - `CGST` & `SGST` (IGST automatically converted into 50% CGST + 50% SGST)
  - `Freight` (if applicable)
- **Border**: Full horizontal line across page at `110.0F`.

### Row 2: Totals Row (`Rupees ... Only` & `Net Amount`)
- **Top**: `110.0F`.
- **Bottom**: `90.0F` (Height: 20.0 pt).
- **Left Column**:
  - `Rupees <Amount in Words> Only.` in `Times-Bold` 9 pt, vertically centered at `Y = 96.0F`.
- **Right Column**:
  - `Net Amount:` in `Times-Bold` 10 pt right-aligned before amount divider.
  - `<net_amount>` in `Times-Bold` 12 pt right-aligned in amount column.
- **Border**: Full horizontal line across page at `90.0F`.

### Row 3: Bank Details & Notes (Left) + Company Signatory (Right)
- **Top**: `90.0F`.
- **Bottom**: `36.0F` (Height: 54.0 pt).
- **Left Column (Bank Details & Notes kept down)**:
  - `Bank Name  : BANK OF BARODA` (Y = 78.5F)
  - `A/c No.        : 06080200000494` (Y = 67.0F)
  - `IFSC Code   : BARB0SALEMX, Branch: Salem Main` (Y = 55.5F)
  - `Notes: <note>` (Y = 44.0F) -> Notes placed at the bottom.
- **Right Column (Signatory)**:
  - `For <Company Name>` (e.g. `For TEKKNOW ENGINEERING COMPANY`) in `Times-Bold` 8.5 pt, centered at `Y = 78.5F`.
  - Open space for physical stamp and signature.
  - `Authorized Signatory` in `Times-Bold` 8.5 pt, centered at `Y = 44.0F`.
- **Border**: Full horizontal line across page at `36.0F`.

### Row 4: Jurisdiction Footer (Below 36.0 pt)
- Rendered at `Y = 22.0F`:
  - Left: `Goods once sold cannot be taken back or exchanged.` (`Times-Bold` 8 pt, centered in left half).
  - Right: `Subject to Salem Jurisdiction.` (`Times-Bold` 8 pt, centered in right half).
- Bottom page margin: `10.0F`.

---

## 4. Files Modified

| S.No | File Path | Purpose |
| :--- | :--- | :--- |
| 1 | `web/web/tekknow/tekknow/src/com/hiq/trade/util/WritePDFImpl.java` | Original Invoice PDF Generator |
| 2 | `web/web/tekknow/tekknow/src/com/hiq/trade/util/WriteDuplicate.java` | Duplicate Copy PDF Generator |
| 3 | `web/web/tekknow/tekknow/src/com/hiq/trade/util/WriteTrans.java` | Transport Copy PDF Generator |
| 4 | `web/web/tekknow/tekknow/web/WEB-INF/classes/com/hiq/trade/util/*.class` | Compiled bytecode deployed in Tomcat |

---

## 5. Compilation & Deployment

Adoptium JDK 8 compilation command:
```powershell
$jars = (Get-ChildItem "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\web\WEB-INF\lib\*.jar" | ForEach-Object { $_.FullName }) -join ";"
$jars += ";d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\apache-tomcat-7.0.41\lib\servlet-api.jar"
& "C:\Program Files\Eclipse Adoptium\jdk-8.0.504.1-hotspot\bin\javac.exe" `
  -cp "$jars;d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\web\WEB-INF\classes" `
  -d "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\web\WEB-INF\classes" `
  "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\src\com\hiq\trade\util\WritePDFImpl.java" `
  "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\src\com\hiq\trade\util\WriteDuplicate.java" `
  "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\src\com\hiq\trade\util\WriteTrans.java"
```

Context reload:
```powershell
(Get-Item "d:\Sample_projects\High_Q_software\tekknow\web\web\tekknow\tekknow\web\WEB-INF\web.xml").LastWriteTime = Get-Date
```

---

## 6. Verification Results

| Invoice No | Copy Type | Verification Point | Status |
| :--- | :--- | :--- | :--- |
| **37050** | Original | Taxable Value 32.80; `CGST @ 9.00%` (2.95) & `SGST @ 9.00%` (2.95); `Rupees Thirty Nine Only.` & `Net Amount: 39.00` above Bank details; `Notes:` at bottom; zero dead whitespace | Verified via `invoice_37050_v13.png` |
| **37050** | Duplicate | `TAX INVOICE (DUPLICATE COPY)`; identical rearranged layout and dynamic spacing | Verified via `invoice_37050_dup_v13.png` |
| **37050** | Transport | `TAX INVOICE (TRANSPORT COPY)`; identical rearranged layout and dynamic spacing | Verified via `invoice_37050_trans_v13.png` |
| **37038** | Original | Single item; dynamic `typ` for 1 HSN row; `Rupees Eleven Only.` & `Net Amount: 11.00`; Bank details & Notes | Verified via `invoice_37038_v12.png` |
