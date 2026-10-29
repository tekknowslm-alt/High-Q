package com.hiq.trade.util;

import com.core.util.DatabaseUtil;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDFontDescriptor;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

public class WritePDFImpl extends com.core.report.WritePDF
{
  public WritePDFImpl() {}
  
  private String invoiceNo = "";
  private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", 
    Locale.ENGLISH);
  private static SimpleDateFormat formatDisplay = new SimpleDateFormat(
    "dd/MM/yyyy", Locale.ENGLISH);
  boolean printBold = false;
  
  public void renderTitleForPage() throws Exception {
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet r = null;
    try {
      ArrayList<HashMap<String, String>> titles = new ArrayList();
      HashMap<String, String> title = new HashMap();
      cn = DatabaseUtil.getConnection();
      
      pt = cn.prepareStatement("select comp_name companyname,address compaddressone,'' compaddresstwo,'SALEM' compcity,'' compstate,'636 001' comppin,'' compemail,phone compphoneno,c1.gstin_no comptinno,concat('PAN: ','12312313') compcstno,' ' comppan,' ' cst_date,mobile compcell,'33' areacode from company c1,f_invoice f1 where c1.c_code=f1.c_code and f1.invoice_code=" + 
        invoiceNo);
      
      pt.clearParameters();
      
      r = pt.executeQuery();
      if (r.next()) {
        float currentYp = getCurrentYPos();
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "GSTIN       : " + r.getString("comptinno"));
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "State Code : " + r.getString("areacode"));
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        
 

        createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
        float currentY1 = getCurrentYPos();
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "Phone  :");
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "Mobile :");
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageContentMaxWidth() - 100.0F, currentYp, titles);
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", r.getString("compphoneno"));
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put("title", r.getString("compcell"));
        title.put("width", String.valueOf(getContentWidth() - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        

        createTitle(getPageContentMaxWidth() - 60.0F, currentYp, titles);
        titles.clear();
		title = new HashMap<String, String>();
		title.put("size", "10");
		title.put("title", "");
		title.put("width", String.valueOf(getContentWidth() - 50));
		title.put("align", "l");
		title.put("font", "b");
		titles.add(title); 
		/*
		 * title=new HashMap<String,String>(); title.put("size", "12");
		 * title.put("title", "Invoice Time     :"+); title.put("width",
		 * String.valueOf(getContentWidth()-50)); title.put("align", "l");
		 * titles.add(title);
		 */
		createTitle(getPageContentMaxWidth() - 100, currentYp-25, titles);
		
		
        titles.clear();
        title = new HashMap();
        title.put("size", "8");
        title.put("title", "Sri Ramajayam");
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageContentMinWidth(), 833.0F, titles);
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "TAX INVOICE");
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        
        createTitle(getPageContentMinWidth(), currentYp - 5.0F, titles);
        


        titles.clear();
        title.put("size", "20");
        title.put("title", r.getString("companyname"));
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        title.put("color", "#322f2323");
        
        titles.add(title);
        float cyp = getCurrentYPos();
        createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "Industrial Parts Supplier");
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put(
          "title", 
          r.getString("compaddressone") + ", " + 
          r.getString("compaddresstwo"));
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put(
          "title", 
          r.getString("compcity") + " - " + 
          r.getString("comppin"));
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
        
		drawImage(0, getPageWidth() - getPageMarginRight() - 100, cyp - 70, 90, 40);
		//drawImage(1, getPageWidth() - getPageMarginRight()-550, cyp - 70, 80, 55);

        changeYPosBy(10.0F);
        drawLine(getPageMarginLeft(), getCurrentYPos(), getPageWidth() - 
          getPageMarginRight(), getCurrentYPos());
        changeYPosBy(2.0F);
      }
      r.close();
      pt.close();
      r = null;
      pt = null;
    } catch (Exception e) {
      throw e;
    } finally {
      try {
        if (r != null) {
          r.close();
        }
        if (pt != null) {
          pt.close();
        }
        if (cn != null) {
          cn.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  
  public void writeSimpleDocument(String invNo, OutputStream stream)
    throws Exception
  {
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    ResultSet rs1 = null;
    PreparedStatement pstmt1 = null;
    try {
      invoiceNo = invNo;
      conn = DatabaseUtil.getConnection();
      StringBuffer strQuery = new StringBuffer(100);
      
      strQuery.append("select 'M/s' cust_title,bill_no bill_no,ledger_name cust_name,ifnull(addr1,'') cust_addr1,");
      strQuery.append("ifnull(addr2,'') cust_addr2,ifnull(addr3,'') cust_addr3,ifnull(place,'') cust_city,'' cust_pin,'' cust_state,");
      strQuery.append("'M/s' scust_title,ifnull(s_ledger_name,'') scust_name,ifnull(s_addr1,'') scust_addr1,");
      strQuery.append("ifnull(s_addr2,'') scust_addr2, ifnull(s_addr3,' ') scust_addr3, ifnull(s_place,' ') scust_city,ifnull(s_ph_no, ' ') sph_no, concat('GSTIN: ', ifnull(s_gstin_no,'')) s_gstin_no,concat('State Code: ' , ifnull(s_state_code,'')) s_state_code,");
      strQuery.append("201 sh_no,1800 sh_bill_amount,total_amt wordnetamt,format(total_amt,2,'en_IN') sh_net_amount,0 sh_roundoff,concat('GST No: ',ifnull(l1.gstin_no,'')) tinno,concat('GST No: ',ifnull(l1.gstin_no,'')) stinno,DATE_FORMAT(bill_date,'%d/%m/%Y') bill_date,'40s' cnts,8320 ends,1865 setno,11180 mtrs,'Bannari Amman' mill,");
      strQuery.append("'Agencies' agency,ewaybill_no ewaybill_no,'Pono' setno1,'02/07/2017'  setdate1,concat(transport_name,case paid_to_pay when 'T' then ' (To-Pay)' when 'P' then ' (Paid)' end) transport,paid_to_pay,lr_no lrno,ifnull(f1.note,'') note,DATE_FORMAT(lr_date,'%d/%m/%Y') lrdate,round(freight,0) as freight,ifnull(courier_charges,'') as courier_charges,ifnull(weight,0) weight,'Destination' destination,");
      

      strQuery.append("c1.bank_name bankname,c1.bank_act_no acno,'ABQPV4678N' panno,comp_name comp_name,disc_per discount_per,format(discount,2,'en_IN') discount_amount,");
      strQuery.append("igst_per igst_per,format(igst_amount,2,'en_IN')  igst_amount,cgst_per cgst_per,format(cgst_amount,2,'en_IN')  cgst_amount,sgst_per sgst_per,format(sgst_amount,2,'en_IN')  sgst_amount,concat('PAN: 23124124') lpanno,");
      strQuery.append("'notes' notes,concat('State Code: ',ifnull(l1.state_code,'')) lstatecode,ifnull(ordered_by,'') orderedby,ifnull(total_bales,0) noofbales,ifnull(c1.branch,'') bankbranch,ifnull(c1.ifsc,'') ifsccode,format( (select ifnull(sum(amount),0) from f_invoice_det f2 where f2.invoice_code=f1.invoice_code)-discount,2,'en_IN')  gross_amt  from f_invoice f1,ledger_mast l1,company c1,transport_mast t1 where f1.transport_code=t1.transport_code and f1.c_code=c1.c_code and f1.ledger_code=l1.ledger_code and invoice_code=" + 
        invoiceNo);
      System.out.println(strQuery.toString());
      pstmt1 = conn.prepareStatement(strQuery.toString());
      rs1 = pstmt1.executeQuery();
      if (rs1.next()) {
        ArrayList<String> imgs = new ArrayList();
        try {
          setUseContext(false);
          //imgs.add("tekknow.jpg");
          imgs.add("tekknow_grey.jpg");
          initializeDocument(25.0F, 10.0F, 10.0F, 10.0F, true, 0.0F, imgs, 
            PDPage.PAGE_SIZE_A4);
        } catch (Exception eex) {
          eex.printStackTrace();
          imgs.clear();
          imgs.add("/web/images/login_lgo.jpg");
          //imgs.add("/web/images/login_lgo2.jpg");
          initializeDocument(25.0F, 10.0F, 10.0F, 30.0F, true, 0.0F, imgs, 
            PDPage.PAGE_SIZE_A4);
        }
        
        renderTitleForPage();
        ArrayList<HashMap<String, String>> titles = new ArrayList();
        HashMap<String, String> title = new HashMap();
        











        float contentHalfWidth = getPageWidth() / 2.0F + 25.0F;
        float currentYp = getCurrentYPos();
        float firstY = currentYp;
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", 
          "Invoice No.       : " + rs1.getString("bill_no") + 
          "                                 Date: " + 
          rs1.getString("bill_date"));
        title.put("width", "60");
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        
        title = new HashMap();
        title.put("size", "10");
        title.put("title", 
          "E-Way Bill No. : " + rs1.getString("ewaybill_no"));
        title.put("width", "60");
        title.put("align", "l");
        titles.add(title);
        title = new HashMap();
        title.put("size", "10");
        title.put(
          "title", 
          "Ordered By        : " + 
          rs1.getString("orderedby"));
        
        title.put("width", "60");
        title.put("align", "l");
        titles.add(title);
        createTitle(30.0F, getCurrentYPos(), titles);
        
        titles.clear();
        
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "");
        title.put("width", String.valueOf(getContentWidth() / 2.0F - 75.0F));
        title.put("align", "l");
        titles.add(title);
        
        title = new HashMap();
        
        createTitle(90.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "Transport : " + rs1.getString("transport"));
        title.put("width", String.valueOf(contentHalfWidth - 10.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 10.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "LR.Date   : " + rs1.getString("lrdate"));
        title.put("width", String.valueOf((contentHalfWidth - 10.0F) / 2.0F));
        title.put("align", "l");
        titles.add(title);
        currentYp = getCurrentYPos();
        createTitle(contentHalfWidth + 10.0F, getCurrentYPos(), titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "LR.No.: " + rs1.getString("lrno"));
        title.put("width", String.valueOf((contentHalfWidth - 10.0F) / 4.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 130.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "");
        title.put("width", 
          String.valueOf(getContentWidth() / 2.0F / 3.0F - 30.0F));
        title.put("align", "l");
        titles.add(title);
        currentYp = getCurrentYPos();
        createTitle(contentHalfWidth + 10.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "   Freight :  " + rs1.getString("freight"));
        title.put("width", 
          String.valueOf(getContentWidth() / 2.0F / 3.0F - 30.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 120.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "");
        title.put("width", 
          String.valueOf(getContentWidth() / 2.0F / 3.0F - 30.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth - 10.0F + 
          (contentHalfWidth - 10.0F) / 3.0F * 2.0F, currentYp, 
          titles);
        drawLine(getPageMarginLeft(), getCurrentYPos() - 5.0F, 
          getPageWidth() - getPageMarginRight(), 
          getCurrentYPos() - 5.0F);
        changeYPosBy(5.0F);
        
        currentYp = getCurrentYPos();
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Billing Address");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        titles.add(title);
        createTitle(10.0F, getCurrentYPos(), titles);
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Shipping Address");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        titles.add(title);
        createTitle(contentHalfWidth + 10.0F, currentYp, titles);
        drawLine(getPageMarginLeft(), getCurrentYPos() - 5.0F, 
          getPageWidth() - getPageMarginRight(), 
          getCurrentYPos() - 5.0F);
        changeYPosBy(5.0F);
        currentYp = getCurrentYPos();
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put(
          "title", 
          rs1.getString("cust_title") + " " + 
          rs1.getString("cust_name"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        if ((rs1.getString("cust_addr1") != null) && 
          (!"".equals(rs1.getString("cust_addr1").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("cust_addr1"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        if ((rs1.getString("cust_addr2") != null) && 
          (!"".equals(rs1.getString("cust_addr2").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("cust_addr2"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        if ((rs1.getString("cust_addr3") != null) && 
          (!"".equals(rs1.getString("cust_addr3").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("cust_addr3"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        StringBuffer custState = new StringBuffer(100);
        
        if (!"".equals(rs1.getString("cust_state"))) {
          custState.append(",");
          custState.append(rs1.getString("cust_state"));
        }
        if (!"".equals(rs1.getString("cust_pin"))) {
          custState.append(" - ");
          custState.append(rs1.getString("cust_pin"));
        }
        title = new HashMap();
        title.put("size", "10");
        title.put("title", 
          rs1.getString("cust_city") + custState.toString());
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(30.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", rs1.getString("tinno"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        float gyp = getCurrentYPos();
        createTitle(30.0F, gyp-10, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", rs1.getString("lstatecode"));
        title.put("width", String.valueOf(getContentWidth() / 4.0F));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(contentHalfWidth / 2.0F + 10.0F, gyp-10, titles);
        
        float addrLineY = getCurrentYPos();
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put(
          "title", 
          rs1.getString("scust_title") + " " + 
          rs1.getString("scust_name"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        if ((rs1.getString("scust_addr1") != null) && 
          (!"".equals(rs1.getString("scust_addr1").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("scust_addr1"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        
        if ((rs1.getString("scust_addr2") != null) && 
          (!"".equals(rs1.getString("scust_addr2").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("scust_addr2"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        if ((rs1.getString("scust_addr3") != null) && 
          (!"".equals(rs1.getString("scust_addr3").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("scust_addr3"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        if ((rs1.getString("scust_city") != null) && 
          (!"".equals(rs1.getString("scust_city").trim()))) {
          title = new HashMap();
          title.put("size", "10");
          title.put("title", rs1.getString("scust_city"));
          title.put("width", String.valueOf(getContentWidth() / 2.0F));
          title.put("align", "l");
          titles.add(title);
        }
        if ((rs1.getString("sph_no") != null) && 
                (!"".equals(rs1.getString("sph_no").trim()))) {
                title = new HashMap();
                title.put("size", "10");
                title.put("title", "Ph: " + rs1.getString("sph_no"));
                title.put("width", String.valueOf(getContentWidth() / 2.0F));
                title.put("align", "l");
                titles.add(title);
              }
        createTitle(contentHalfWidth + 10.0F, currentYp, titles); 
 

        titles.clear();
        
        title = new HashMap();
        title.put("size", "10");
        title.put("title", 
          rs1.getString("s_gstin_no") + "                    " + 
          rs1.getString("s_state_code"));
        title.put("width", String.valueOf(getContentWidth() / 4.0F));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(contentHalfWidth / 2.0F + 270.0F, gyp-10, titles);
        
        if (addrLineY < getCurrentYPos()) {
          setCurrentYPos(addrLineY);
        }
        drawLine(getPageMarginLeft(), getCurrentYPos() - 5.0F, 
          getPageWidth() - getPageMarginRight(), 
          getCurrentYPos() - 5.0F);
        drawLine(contentHalfWidth + 5.0F, firstY + 2.0F, 
          contentHalfWidth + 5.0F, getCurrentYPos() - 5.0F);
        changeYPosBy(5.0F);
        



        float pageWidth = getPageWidth() - getPageMarginLeft() - getPageMarginRight();
        float snoWidth = pageWidth * 5.0F / 100.0F;
        float descWidth = pageWidth * 45.0F / 100.0F;
        float hsnWidth = pageWidth * 8.0F / 100.0F;
        float qtyWidth = pageWidth * 6.0F / 100.0F;
        float rateWidth = pageWidth * 10.0F / 100.0F;
        float discWidth = pageWidth * 6.0F / 100.0F;
        float unitWidth = pageWidth * 7.0F / 100.0F;
        float amtWidth = pageWidth * 12.0F / 100.0F;

        ArrayList<HashMap<String, String>> c = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(snoWidth));
        c1.put("caption", "SNo");
        c1.put("name", "sd_sno");
        c1.put("align", "c");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(descWidth));
        c1.put("caption", "Description");
        c1.put("name", "itemdescription");
        c1.put("align", "l");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(hsnWidth));
        c1.put("caption", "HSN");
        c1.put("name", "hsncode");
        c1.put("align", "c");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(qtyWidth));
        c1.put("caption", "Qty");
        c1.put("name", "quantity");
        c1.put("align", "c");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(rateWidth));
        c1.put("caption", "Rate");
        c1.put("name", "rate");
        c1.put("align", "r");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(discWidth));
        c1.put("caption", "Dis%");
        c1.put("name", "spl_disc");
        c1.put("align", "r");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(unitWidth));
        c1.put("caption", "Unit");
        c1.put("name", "unit");
        c1.put("align", "c");
        c1.put("size", "8");
        c.add(c1);

        c1 = new HashMap<String, String>();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(amtWidth + 2.0F));
        c1.put("caption", "Amount");
        c1.put("name", "amount");
        c1.put("align", "r");
        c1.put("size", "8");
        c.add(c1);

        // Determine HSN count to calculate exact lower section height dynamically without dead empty space
        int hsnCount = 1;
        try {
          PreparedStatement psHsnCount = conn.prepareStatement(
            "select count(distinct ifnull(p1.hsn_code,'')) from f_invoice_det f1 left join product_mast p1 on f1.design_code=p1.product_code where f1.invoice_code=" + invoiceNo
          );
          ResultSet rsHsnCount = psHsnCount.executeQuery();
          if (rsHsnCount.next()) {
            hsnCount = rsHsnCount.getInt(1);
          }
          if (hsnCount < 1) hsnCount = 1;
          rsHsnCount.close();
          psHsnCount.close();
        } catch (Exception ignored) {}

        int rightRows = 3; // Taxable Value, CGST, SGST
        if (rs1.getDouble("discount_per") > 0.0D) rightRows++;
        if ((rs1.getDouble("courier_charges") > 0.0D) && ("P".equals(rs1.getString("paid_to_pay")))) rightRows++;
        float rightHeight = rightRows * 13.0F;

        float taxSectionHeight = Math.max(47.0F + (hsnCount * 13.0F), rightHeight);
        float typ = 110.0F + taxSectionHeight;

        float cyp = getCurrentYPos();
        typ = createTableLines(c, cyp - typ, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), cyp);

        float cy = createTableHeader(c, 25.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), cyp, 1, false, 10.0F);
        setCurrentYPos(cy);

        pstmt = conn.prepareStatement(
          "select @rowno:=@rowno+1 sd_sno,d.* from (select p1.product_name itemdescription,concat('(',descr,')') descr,p1.hsn_code hsncode, case when f1.mtrs=0 then '' else f1.mtrs end mtrs,unit_name unit,format(round(rate,2),2,'en_IN') rate,format(round(spl_disc,2),2,'en_IN') spl_disc,format(round(amount,2),2,'en_IN') amount,format(ifnull(f1.pcs,0),3) as quantity from f_invoice_det f1,product_mast p1,unit_mast u1 where f1.design_code=p1.product_code and f1.unit_code=u1.unit_code and f1.invoice_code=" + 
          invoiceNo + 
          " order by f1.sno) d inner join (SELECT @rowno:=0) sno on 1=1");

        rs = pstmt.executeQuery();
        cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), getCurrentYPos(), 1, false, 10.0F);
        setCurrentYPos(cy);
        rs.close();
        pstmt.close();
        pstmt = null;

        pstmt = conn.prepareStatement(
          "select '' sd_sno,'E. & O.E.                                                             Total ' itemdescription,'' descr,'' hsncode,format(ifnull(sum(pcs),0),3) quantity,'' unit,'' rate,'' spl_disc,format(ifnull(sum(amount),0),2,'en_IN') amount,ifnull(sum(pcs),0) as pcs,ifnull(sum(mtrs),0) mtrs from f_invoice_det f1 where invoice_code=" + 
          invoiceNo);
        pstmt.clearParameters();

        rs = pstmt.executeQuery();
        cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), typ + 17.0F, 1, false, 10.0F);
        setCurrentYPos(cy - 2.0F);
        rs.close();
        pstmt.close();
        pstmt = null;

        drawLine(getPageMarginLeft(), typ + 15.0F, getPageMarginLeft() + 
          snoWidth + descWidth + hsnWidth + unitWidth + 
          rateWidth + discWidth + amtWidth + qtyWidth, typ + 15.0F);

        drawLine(getPageMarginLeft(), typ, getPageWidth() - getPageMarginRight(), typ);

        // Tax Summary (3/4 width on Left) + Taxable Value & Taxes (1/4 width on Right)
        float dividerX = getPageMarginLeft() + snoWidth + descWidth + hsnWidth + qtyWidth + rateWidth;
        float leftWidth = dividerX - getPageMarginLeft();
        float dividerAmtX = dividerX + discWidth + unitWidth;
        float rightMargin = getPageWidth() - getPageMarginRight();

        // 1. Render Tax Summary on Left (3/4 width) starting at typ down to 110.0F
        TaxSummaryResult taxRes = renderTaxSummary(conn, invoiceNo, typ, leftWidth, 110.0F);
        float taxSummaryEndY = 110.0F;

        // 2. Right: Taxes (Taxable Value, Discount, CGST, SGST, Freight)
        // Starting at typ (same horizontal level as Tax Summary)
        float taxRowY = typ - 11.5F;
        float labelW = dividerAmtX - dividerX - 4.0F;
        float amtW = rightMargin - dividerAmtX;

        // (a) Taxable Value
        drawText(PDType1Font.TIMES_BOLD, 9.0F, dividerX + 4.0F, taxRowY, "Taxable Value");
        drawCellText(rs1.getString("gross_amt"), dividerAmtX, taxRowY, amtW, "r", PDType1Font.TIMES_BOLD, 9.0F);
        taxRowY -= 13.0F;

        // (b) Discount (if any)
        if (rs1.getDouble("discount_per") > 0.0D) {
          String discTitle = "Discount @ " + rs1.getString("discount_per") + "%";
          try {
            pstmt = conn.prepareStatement("select concat(ifnull(disc_text,'Discount'),' @ ',disc_per,'%') dt, format(discount,2,'en_IN') da from f_invoice where invoice_code=" + invoiceNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
              discTitle = rs.getString("dt");
            }
            rs.close();
            pstmt.close();
          } catch (Exception ex) {}
          drawCellText(discTitle, dividerX, taxRowY, labelW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          drawCellText(rs1.getString("discount_amount"), dividerAmtX, taxRowY, amtW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          taxRowY -= 13.0F;
        }

        // (c) CGST and SGST (ALWAYS CGST & SGST, NEVER IGST)
        String cgstRateStr = "";
        String cgstAmtStr = "";
        String sgstRateStr = "";
        String sgstAmtStr = "";

        if (rs1.getDouble("cgst_per") > 0.0D) {
          cgstRateStr = String.format(Locale.ENGLISH, "%.2f", rs1.getDouble("cgst_per"));
          cgstAmtStr = rs1.getString("cgst_amount");
          sgstRateStr = String.format(Locale.ENGLISH, "%.2f", rs1.getDouble("sgst_per"));
          sgstAmtStr = rs1.getString("sgst_amount");
        } else if (rs1.getDouble("igst_per") > 0.0D) {
          double halfRate = rs1.getDouble("igst_per") / 2.0;
          double igstAmt = 0.0;
          try {
            igstAmt = Double.parseDouble(rs1.getString("igst_amount").replace(",", ""));
          } catch (Exception ignored) {}
          double halfAmt = Math.round((igstAmt / 2.0) * 100.0) / 100.0;
          double otherHalfAmt = igstAmt - halfAmt;
          cgstRateStr = String.format(Locale.ENGLISH, "%.2f", halfRate);
          cgstAmtStr = String.format(Locale.ENGLISH, "%,.2f", halfAmt);
          sgstRateStr = String.format(Locale.ENGLISH, "%.2f", halfRate);
          sgstAmtStr = String.format(Locale.ENGLISH, "%,.2f", otherHalfAmt);
        } else if (taxRes.totCgst > 0.0D) {
          cgstRateStr = String.format(Locale.ENGLISH, "%.2f", taxRes.maxCgstRate);
          cgstAmtStr = String.format(Locale.ENGLISH, "%,.2f", taxRes.totCgst);
          sgstRateStr = String.format(Locale.ENGLISH, "%.2f", taxRes.maxSgstRate);
          sgstAmtStr = String.format(Locale.ENGLISH, "%,.2f", taxRes.totSgst);
        }

        if (!cgstRateStr.isEmpty() && !cgstAmtStr.isEmpty()) {
          drawCellText("CGST @ " + cgstRateStr + "%", dividerX, taxRowY, labelW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          drawCellText(cgstAmtStr, dividerAmtX, taxRowY, amtW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          taxRowY -= 13.0F;

          drawCellText("SGST @ " + sgstRateStr + "%", dividerX, taxRowY, labelW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          drawCellText(sgstAmtStr, dividerAmtX, taxRowY, amtW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          taxRowY -= 13.0F;
        }

        // (d) Freight (if any)
        if ((rs1.getDouble("courier_charges") > 0.0D) && ("P".equals(rs1.getString("paid_to_pay")))) {
          drawCellText("Freight", dividerX, taxRowY, labelW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          drawCellText(rs1.getString("courier_charges"), dividerAmtX, taxRowY, amtW, "r", PDType1Font.TIMES_ROMAN, 8.5F);
          taxRowY -= 13.0F;
        }

        // Right-side vertical lines down to 110.0F
        drawLine(dividerX, typ, dividerX, 110.0F);
        drawLine(dividerAmtX, typ, dividerAmtX, 110.0F);
        drawLine(rightMargin, typ, rightMargin, 110.0F);

        // Solid horizontal line across full page width at 110.0F
        drawLine(getPageMarginLeft(), 110.0F, rightMargin, 110.0F);

        // 3. Row: Rupees in Words (Left) & Net Amount (Right) - (from 110.0F down to 90.0F)
        java.math.BigDecimal amt = java.math.BigDecimal.valueOf(rs1.getDouble("wordnetamt"));
        String amountInWords = "Rupees " + NumberToWord.convertNumberToWords(amt) + " Only.";
        drawCellText(amountInWords, getPageMarginLeft() + 4.0F, 96.0F, leftWidth - 8.0F, "l", PDType1Font.TIMES_BOLD, 9.0F);

        drawCellText("Net Amount:", dividerX, 96.0F, dividerAmtX - dividerX - 4.0F, "r", PDType1Font.TIMES_BOLD, 10.0F);
        drawCellText(rs1.getString("sh_net_amount"), dividerAmtX, 96.0F, amtW, "r", PDType1Font.TIMES_BOLD, 12.0F);

        // Vertical dividers & bottom horizontal line for Net Amount row down to 90.0F
        drawLine(getPageMarginLeft(), 110.0F, getPageMarginLeft(), 90.0F);
        drawLine(dividerX, 110.0F, dividerX, 90.0F);
        drawLine(dividerAmtX, 110.0F, dividerAmtX, 90.0F);
        drawLine(rightMargin, 110.0F, rightMargin, 90.0F);
        drawLine(getPageMarginLeft(), 90.0F, rightMargin, 90.0F);

        // 4. Row: Bank Details & Notes (Left) + Signatory (Right) - (from 90.0F down to 36.0F)
        float bottomBoxY = 36.0F;

        String bName = rs1.getString("bankname");
        if (bName == null || bName.trim().isEmpty()) bName = "BANK OF BARODA";
        String bAc = rs1.getString("acno");
        if (bAc == null || bAc.trim().isEmpty()) bAc = "06080200000494";
        String bIfsc = rs1.getString("ifsccode");
        if (bIfsc == null || bIfsc.trim().isEmpty()) bIfsc = "BARB0SALEMX";
        String bBranch = rs1.getString("bankbranch");
        if (bBranch == null || bBranch.trim().isEmpty()) bBranch = "Salem Main";

        String noteVal = rs1.getString("note");
        if (noteVal == null || "null".equalsIgnoreCase(noteVal.trim())) noteVal = "";

        // Bank Details on Left (Notes kept down at the bottom)
        drawText(PDType1Font.TIMES_ROMAN, 9.0F, getPageMarginLeft() + 4.0F, 78.5F, "Bank Name  : " + bName);
        drawText(PDType1Font.TIMES_ROMAN, 9.0F, getPageMarginLeft() + 4.0F, 67.0F, "A/c No.        : " + bAc);
        drawText(PDType1Font.TIMES_ROMAN, 9.0F, getPageMarginLeft() + 4.0F, 55.5F, "IFSC Code   : " + bIfsc + ", Branch: " + bBranch);
        drawText(PDType1Font.TIMES_BOLD, 8.5F, getPageMarginLeft() + 4.0F, 44.0F, "Notes: " + noteVal);

        // Company Signatory on Right
        float sigWidth = rightMargin - dividerX;
        drawCellText("For " + rs1.getString("comp_name"), dividerX, 78.5F, sigWidth, "c", PDType1Font.TIMES_BOLD, 8.5F);
        drawCellText("Authorized Signatory", dividerX, 44.0F, sigWidth, "c", PDType1Font.TIMES_BOLD, 8.5F);

        // Box lines for Bank & Signatory down to bottomBoxY
        drawLine(getPageMarginLeft(), 90.0F, getPageMarginLeft(), bottomBoxY);
        drawLine(dividerX, 90.0F, dividerX, bottomBoxY);
        drawLine(rightMargin, 90.0F, rightMargin, bottomBoxY);
        drawLine(getPageMarginLeft(), bottomBoxY, rightMargin, bottomBoxY);

        // 5. Bottom Jurisdiction Notes at 22.0F
        titles.clear();
        title = new HashMap<String, String>();
        title.put("size", "8");
        title.put("title", "Goods once sold cannot be taken back or exchanged.");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageMarginLeft(), 22.0F, titles);

        titles.clear();
        title = new HashMap<String, String>();
        title.put("size", "8");
        title.put("title", "Subject to Salem Jurisdiction.");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageMarginLeft() + getContentWidth() / 2.0F, 22.0F, titles);

        closeContent();
      }

      conn.close();
      saveDocument(stream);
      closeDocument();
    } catch (Exception e) {
      e.printStackTrace();
      throw e;
    } finally {
      try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (rs1 != null) rs1.close();
        if (pstmt1 != null) pstmt1.close();
        if (conn != null) conn.close();
      } catch (SQLException localSQLException) {}
    }
  }

  private void drawText(PDFont font, float fontSize, float x, float y, String text) throws Exception {
    if (text == null || text.trim().isEmpty()) return;
    getContent().beginText();
    getContent().setFont(font, fontSize);
    getContent().moveTextPositionByAmount(x, y);
    getContent().drawString(text);
    getContent().endText();
  }

  private void drawCellText(String text, float x, float y, float width, String align, PDFont font, float fontSize) throws Exception {
    if (text == null || text.trim().isEmpty()) return;
    float textWidth = font.getStringWidth(text) / 1000.0F * fontSize;
    if (textWidth > width - 4.0F && width > 20.0F) {
      fontSize = fontSize * (width - 4.0F) / textWidth;
      textWidth = font.getStringWidth(text) / 1000.0F * fontSize;
    }
    float drawX = x;
    if ("c".equals(align)) {
      drawX = x + (width - textWidth) / 2.0F;
    } else if ("r".equals(align)) {
      drawX = x + width - textWidth - 3.0F;
    } else {
      drawX = x + 3.0F;
    }
    getContent().beginText();
    getContent().setFont(font, fontSize);
    getContent().moveTextPositionByAmount(drawX, y);
    getContent().drawString(text);
    getContent().endText();
  }

  static class TaxSummaryResult {
    float endY;
    double totTaxable;
    double totCgst;
    double totSgst;
    double totTax;
    double maxCgstRate;
    double maxSgstRate;
  }

  private TaxSummaryResult renderTaxSummary(Connection conn, String invNo, float startY, float tableWidth, float targetEndY) throws Exception {
    PDFont fontBold = PDType1Font.TIMES_BOLD;
    PDFont fontRoman = PDType1Font.TIMES_ROMAN;
    float tableLeft = getPageMarginLeft();
    
    float titleHeight = 12.0F;
    float colHeaderTop = startY - titleHeight;
    drawLine(tableLeft, startY, tableLeft + tableWidth, startY);
    drawText(fontBold, 8.5F, tableLeft + 3.0F, startY - 9.0F, "Tax Summary:");
    drawLine(tableLeft, colHeaderTop, tableLeft + tableWidth, colHeaderTop);
    
    float colHsn = 65.0F;
    float colTaxable = 85.0F;
    float colCgstRate = 35.0F;
    float colCgstAmt = 60.0F;
    float colSgstRate = 35.0F;
    float colSgstAmt = 60.0F;
    float colTotalTax = tableWidth - (colHsn + colTaxable + colCgstRate + colCgstAmt + colSgstRate + colSgstAmt);
    
    float headerHeight = 22.0F;
    float headerBottom = colHeaderTop - headerHeight;
    drawLine(tableLeft, headerBottom, tableLeft + tableWidth, headerBottom);
    
    float headerMidY = colHeaderTop - (headerHeight / 2.0F);
    float cgstStart = tableLeft + colHsn + colTaxable;
    float sgstStart = cgstStart + colCgstRate + colCgstAmt;
    float totalTaxStart = tableLeft + tableWidth - colTotalTax;

    drawLine(cgstStart, headerMidY, totalTaxStart, headerMidY);
    
    drawCellText("HSN/ SAC", tableLeft, headerBottom + 7.0F, colHsn, "c", fontBold, 7.5F);
    drawCellText("Taxable amount (Rs.)", tableLeft + colHsn, headerBottom + 7.0F, colTaxable, "c", fontBold, 7.0F);
    
    drawCellText("CGST", cgstStart, headerMidY + 3.0F, colCgstRate + colCgstAmt, "c", fontBold, 7.5F);
    drawCellText("Rate (%)", cgstStart, headerBottom + 3.0F, colCgstRate, "c", fontBold, 6.5F);
    drawCellText("Amt (Rs.)", cgstStart + colCgstRate, headerBottom + 3.0F, colCgstAmt, "c", fontBold, 6.5F);
    
    drawCellText("SGST", sgstStart, headerMidY + 3.0F, colSgstRate + colSgstAmt, "c", fontBold, 7.5F);
    drawCellText("Rate (%)", sgstStart, headerBottom + 3.0F, colSgstRate, "c", fontBold, 6.5F);
    drawCellText("Amt (Rs.)", sgstStart + colSgstRate, headerBottom + 3.0F, colSgstAmt, "c", fontBold, 6.5F);
    
    drawCellText("Total Tax (Rs.)", totalTaxStart, headerBottom + 7.0F, colTotalTax, "c", fontBold, 7.0F);
    
    PreparedStatement psTax = conn.prepareStatement(
      "select ifnull(p1.hsn_code,'') hsn_code, " +
      "sum(ifnull(f1.taxable_amt, f1.amount - ifnull(f1.disc_amt,0))) taxable_amount, " +
      "max(ifnull(nullif(p1.gst_per,0)/2.0, (inv.cgst_per + inv.sgst_per + inv.igst_per)/2.0)) cgst_rate, " +
      "round(sum(ifnull(f1.taxable_amt, f1.amount - ifnull(f1.disc_amt,0))) * (max(ifnull(nullif(p1.gst_per,0)/2.0, (inv.cgst_per + inv.sgst_per + inv.igst_per)/2.0)) / 100.0), 2) cgst_amt, " +
      "max(ifnull(nullif(p1.gst_per,0)/2.0, (inv.cgst_per + inv.sgst_per + inv.igst_per)/2.0)) sgst_rate, " +
      "round(sum(ifnull(f1.taxable_amt, f1.amount - ifnull(f1.disc_amt,0))) * (max(ifnull(nullif(p1.gst_per,0)/2.0, (inv.cgst_per + inv.sgst_per + inv.igst_per)/2.0)) / 100.0), 2) sgst_amt, " +
      "round(sum(ifnull(f1.taxable_amt, f1.amount - ifnull(f1.disc_amt,0))) * (max(ifnull(nullif(p1.gst_per,0), (inv.cgst_per + inv.sgst_per + inv.igst_per))) / 100.0), 2) total_tax " +
      "from f_invoice_det f1 " +
      "left join product_mast p1 on f1.design_code=p1.product_code " +
      "inner join f_invoice inv on f1.invoice_code=inv.invoice_code " +
      "where f1.invoice_code=" + invNo + " " +
      "group by p1.hsn_code order by p1.hsn_code"
    );
    
    ResultSet rsTax = psTax.executeQuery();
    float rowY = headerBottom;
    float rowHeight = 13.0F;
    double totTaxable = 0.0;
    double totCgst = 0.0;
    double totSgst = 0.0;
    double totTax = 0.0;
    double maxCgstR = 0.0;
    double maxSgstR = 0.0;
    
    while (rsTax.next()) {
      float nextRowY = rowY - rowHeight;
      drawLine(tableLeft, nextRowY, tableLeft + tableWidth, nextRowY);
      
      String hsn = rsTax.getString("hsn_code");
      if (hsn == null || hsn.trim().isEmpty() || "0".equals(hsn.trim())) {
        hsn = "OTHERS";
      }
      double taxable = rsTax.getDouble("taxable_amount");
      double cgstR = rsTax.getDouble("cgst_rate");
      double cgstA = rsTax.getDouble("cgst_amt");
      double sgstR = rsTax.getDouble("sgst_rate");
      double sgstA = rsTax.getDouble("sgst_amt");
      double tTax = rsTax.getDouble("total_tax");
      
      totTaxable += taxable;
      totCgst += cgstA;
      totSgst += sgstA;
      totTax += tTax;
      if (cgstR > maxCgstR) maxCgstR = cgstR;
      if (sgstR > maxSgstR) maxSgstR = sgstR;
      
      float textY = nextRowY + 3.5F;
      drawCellText(hsn, tableLeft, textY, colHsn, "c", fontRoman, 7.0F);
      drawCellText(String.format(Locale.ENGLISH, "%,.2f", taxable), tableLeft + colHsn, textY, colTaxable, "r", fontRoman, 7.0F);
      
      drawCellText(String.format(Locale.ENGLISH, "%.1f", cgstR), cgstStart, textY, colCgstRate, "c", fontRoman, 7.0F);
      drawCellText(String.format(Locale.ENGLISH, "%,.2f", cgstA), cgstStart + colCgstRate, textY, colCgstAmt, "r", fontRoman, 7.0F);
      
      drawCellText(String.format(Locale.ENGLISH, "%.1f", sgstR), sgstStart, textY, colSgstRate, "c", fontRoman, 7.0F);
      drawCellText(String.format(Locale.ENGLISH, "%,.2f", sgstA), sgstStart + colSgstRate, textY, colSgstAmt, "r", fontRoman, 7.0F);
      
      drawCellText(String.format(Locale.ENGLISH, "%,.2f", tTax), totalTaxStart, textY, colTotalTax, "r", fontRoman, 7.0F);
      
      rowY = nextRowY;
    }
    rsTax.close();
    psTax.close();
    
    // TOTAL row down to targetEndY
    float totalRowBottom = targetEndY;
    drawLine(tableLeft, totalRowBottom, tableLeft + tableWidth, totalRowBottom);
    float totTextY = totalRowBottom + 3.5F;
    
    drawCellText("TOTAL", tableLeft, totTextY, colHsn, "c", fontBold, 7.5F);
    drawCellText(String.format(Locale.ENGLISH, "%,.2f", totTaxable), tableLeft + colHsn, totTextY, colTaxable, "r", fontBold, 7.0F);
    drawCellText(String.format(Locale.ENGLISH, "%,.2f", totCgst), cgstStart + colCgstRate, totTextY, colCgstAmt, "r", fontBold, 7.0F);
    drawCellText(String.format(Locale.ENGLISH, "%,.2f", totSgst), sgstStart + colSgstRate, totTextY, colSgstAmt, "r", fontBold, 7.0F);
    drawCellText(String.format(Locale.ENGLISH, "%,.2f", totTax), totalTaxStart, totTextY, colTotalTax, "r", fontBold, 7.0F);
    
    // Vertical divider lines
    drawLine(tableLeft, startY, tableLeft, totalRowBottom);
    float curX = tableLeft + colHsn;
    drawLine(curX, colHeaderTop, curX, totalRowBottom);
    curX += colTaxable;
    drawLine(curX, colHeaderTop, curX, totalRowBottom);
    
    drawLine(curX + colCgstRate, headerMidY, curX + colCgstRate, totalRowBottom);
    curX += colCgstRate + colCgstAmt;
    drawLine(curX, colHeaderTop, curX, totalRowBottom);
    drawLine(curX + colSgstRate, headerMidY, curX + colSgstRate, totalRowBottom);
    curX += colSgstRate + colSgstAmt;
    drawLine(curX, colHeaderTop, curX, totalRowBottom);
    
    drawLine(tableLeft + tableWidth, startY, tableLeft + tableWidth, totalRowBottom);
    
    TaxSummaryResult res = new TaxSummaryResult();
    res.endY = totalRowBottom;
    res.totTaxable = totTaxable;
    res.totCgst = totCgst;
    res.totSgst = totSgst;
    res.totTax = totTax;
    res.maxCgstRate = maxCgstR;
    res.maxSgstRate = maxSgstR;
    return res;
  }
  
  public void createItalicTitle(float startXPos, float startYPos, ArrayList<HashMap<String, String>> titles)
    throws Exception
  {
    int s = titles.size();
    for (int i = 0; i < s; i++) {
      HashMap<String, String> m = (HashMap)titles.get(i);
      int fontSize = Integer.parseInt((String)m.get("size"));
      String align = (String)m.get("align");
      String title = (String)m.get("title");
      String ft = (String)m.get("font");
      PDFont font = null;
      font = PDType1Font.TIMES_ITALIC;
      float width = Float.parseFloat((String)m.get("width"));
      float titleWidth = font.getStringWidth(title) / 1000.0F * fontSize;
      float titleHeight = font.getFontDescriptor().getFontBoundingBox()
        .getHeight() / 
        1000.0F * fontSize;
      float x = startXPos + (width - titleWidth) / 2.0F;
      if ("r".equals(align)) {
        x = startXPos + width - titleWidth;
      } else if ("l".equals(align)) {
        x = startXPos;
      }
      getContent().beginText();
      getContent().setFont(font, fontSize);
      getContent().moveTextPositionByAmount(x, startYPos - titleHeight);
      getContent().drawString(title);
      getContent().endText();
      startYPos -= titleHeight;
    }
    setCurrentYPos(startYPos);
  }
  
  public float createTableLines(ArrayList<HashMap<String, String>> columns, float height, float width, float startXPos, float startYPos)
    throws Exception
  {
    float current = startYPos;
    int s = columns.size();
    float originalPosition = startYPos - height;
    PDFont font = PDType1Font.TIMES_BOLD;
    






    getContent().drawLine(startXPos, startYPos - height, startXPos + width, 
      startYPos - height);
    float currentX = startXPos;
    float currentY = startYPos;
    for (int i = 0; i < s; i++) {
      HashMap<String, String> column = (HashMap)columns.get(i);
      float margin = 0.0F;
      float w = Float.parseFloat((String)column.get("width"));
      currentY = startYPos;
      if (i != s - 1) {
        getContent().drawLine(currentX + w + margin, startYPos, 
          currentX + w + margin, startYPos - height);
      }
      currentX += w + margin;
    }
    return current - height;
  }
  
  public float createParagraph(String title, String inText, float width, float startXPos, float startYPos, float lineSpace, int fontSize)
    throws Exception
  {
    PDFont font = PDType1Font.TIMES_BOLD;
    if (!printBold) {
      font = PDType1Font.TIMES_ROMAN;
    }
    PDFont fontTitle = PDType1Font.TIMES_BOLD;
    int titleFontSize = 10;
    List<String> lines = new ArrayList();
    int lastSpace = -1;
    String text = inText;
    
    while (text.length() > 0) {
      int spaceIndex = text.indexOf(' ', lastSpace + 1);
      if (spaceIndex < 0) {
        lines.add(text);
        text = "";
      } else {
        String subString = text.substring(0, spaceIndex);
        float size = fontSize * font.getStringWidth(subString) / 1000.0F;
        if (size > width) {
          if (lastSpace < 0)
            lastSpace = spaceIndex;
          subString = text.substring(0, lastSpace);
          lines.add(subString);
          text = text.substring(lastSpace).trim();
          lastSpace = -1;
        } else {
          lastSpace = spaceIndex;
        }
      }
    }
    
    float current = startYPos;
    if (!"".equals(title)) {
      float titleHeight = fontTitle.getFontDescriptor()
        .getFontBoundingBox().getHeight() / 
        1000.0F * titleFontSize;
      titleHeight += lineSpace;
      getContent().beginText();
      getContent().setFont(fontTitle, titleFontSize);
      getContent().moveTextPositionByAmount(startXPos, startYPos);
      current -= titleHeight;
      if (getPageContentMinHeight() > current) {
        getContent().endText();
        createPageAndChangePos();
        renderTitleForPage();
        getContent().beginText();
        getContent().setFont(fontTitle, titleFontSize);
        getContent().moveTextPositionByAmount(startXPos, 
          getCurrentYPos());
        current = getCurrentYPos();
        current -= titleHeight;
      }
      getContent().drawString(title);
      getContent().moveTextPositionByAmount(startXPos, -titleHeight);
      getContent().endText();
    }
    if (!"".equals(inText)) {
      float leading = font.getFontDescriptor().getFontBoundingBox()
        .getHeight() / 
        1000.0F * fontSize;
      leading += lineSpace;
      getContent().beginText();
      getContent().setFont(font, fontSize);
      getContent().moveTextPositionByAmount(startXPos, current);
      for (String line : lines) {
        current -= leading;
        if (getPageContentMinHeight() > current) {
          getContent().endText();
          createPageAndChangePos();
          renderTitleForPage();
          getContent().beginText();
          getContent().setFont(font, fontSize);
          getContent().moveTextPositionByAmount(startXPos, 
            getCurrentYPos());
          current = getCurrentYPos();
          current -= leading;
        }
        getContent().drawString(line);
        getContent().moveTextPositionByAmount(0.0F, -leading);
      }
      getContent().endText();
    }
    return current;
  }
}