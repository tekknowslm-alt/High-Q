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

public class WriteDCPrint extends com.core.report.WritePDF
{
  public WriteDCPrint() {}
  
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
      
      pt = cn.prepareStatement("select comp_name companyname,address compaddressone,'' compaddresstwo,'SALEM' compcity,'' compstate,'636 001' comppin,'' compemail,phone compphoneno,c1.gstin_no comptinno,concat('PAN: ','12312313') compcstno,' ' comppan,' ' cst_date,mobile compcell,'33' areacode from company c1,dc f1 where c1.c_code=f1.c_code and f1.invoice_code=" + 
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
		title.put("title", "silkdhoties@gmail.com");
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
        title.put("title", "Sri Krishna");
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageContentMinWidth(), 833.0F, titles);
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "DELIVERY CHALLAN");
        title.put("width", String.valueOf(getContentWidth()));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        
        createTitle(getPageContentMinWidth(), currentYp - 5.0F, titles);
        


        titles.clear();
        title.put("size", "24");
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
        title.put("title", "WHOLESALE HANDLOOM CLOTH MERCHANTS");
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
		drawImage(1, getPageWidth() - getPageMarginRight()-550, cyp - 70, 80, 55);

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
      
      strQuery.append("select 'M/s' cust_title,bill_no bill_no,ledger_name cust_name,addr1 cust_addr1,");
      strQuery.append("addr2 cust_addr2,addr3 cust_addr3,place cust_city,'' cust_pin,'' cust_state,");
      strQuery.append("'M/s' scust_title,s_ledger_name scust_name,s_addr1 scust_addr1,");
      strQuery.append("s_addr2 scust_addr2, ifnull(s_addr3,' ') scust_addr3, ifnull(s_place,' ') scust_city,concat('GSTIN: ', ifnull(s_gstin_no,'')) s_gstin_no,concat('State Code: ' , ifnull(s_state_code,'')) s_state_code,");
      strQuery.append("201 sh_no,1800 sh_bill_amount,total_amt wordnetamt,format(total_amt,2,'en_IN') sh_net_amount,0 sh_roundoff,concat('GST No: ',l1.gstin_no) tinno,concat('GST No: ',l1.gstin_no) stinno,DATE_FORMAT(bill_date,'%d/%m/%Y') bill_date,'40s' cnts,8320 ends,1865 setno,11180 mtrs,'Bannari Amman' mill,");
      strQuery.append("'Agencies' agency,ewaybill_no ewaybill_no,'Pono' setno1,'02/07/2017'  setdate1,concat(transport_name,case paid_to_pay when 'T' then ' (To-Pay)' when 'P' then ' (Paid)' end) transport,paid_to_pay,lr_no lrno,ifnull(f1.note,'') note,DATE_FORMAT(lr_date,'%d/%m/%Y') lrdate,round(freight,0) as freight,courier_charges,weight weight,'Destination' destination,");
      

      strQuery.append("c1.bank_name bankname,c1.bank_act_no acno,'ABQPV4678N' panno,comp_name comp_name,disc_per discount_per,format(discount,2,'en_IN') discount_amount,");
      strQuery.append("igst_per igst_per,format(igst_amount,2,'en_IN')  igst_amount,cgst_per cgst_per,format(cgst_amount,2,'en_IN')  cgst_amount,sgst_per sgst_per,format(sgst_amount,2,'en_IN')  sgst_amount,concat('PAN: 23124124') lpanno,");
      strQuery.append("'notes' notes,concat('State Code: ',ifnull(l1.state_code,'')) lstatecode,ordered_by orderedby,total_bales noofbales,c1.branch bankbranch,c1.ifsc ifsccode,format( (select ifnull(sum(amount),0) from dc_det f2 where f2.invoice_code=f1.invoice_code)-discount,2,'en_IN')  gross_amt  from dc f1,ledger_mast l1,company c1,transport_mast t1 where f1.transport_code=t1.transport_code and f1.c_code=c1.c_code and f1.ledger_code=l1.ledger_code and invoice_code=" + 
        invoiceNo);
      
      pstmt1 = conn.prepareStatement(strQuery.toString());
      rs1 = pstmt1.executeQuery();
      if (rs1.next()) {
        ArrayList<String> imgs = new ArrayList();
        try {
          setUseContext(false);
          imgs.add("tekknow.jpg");
          imgs.add("perumal.jpg");
          initializeDocument(25.0F, 10.0F, 10.0F, 30.0F, true, 0.0F, imgs, 
            PDPage.PAGE_SIZE_A4);
        } catch (Exception eex) {
          eex.printStackTrace();
          imgs.clear();
          imgs.add("/web/images/login_lgo.jpg");
          imgs.add("/web/images/login_lgo2.jpg");
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
          "DC No.             : " + rs1.getString("bill_no") + 
          "                                 Date: " + 
          rs1.getString("bill_date"));
        title.put("width", "60");
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        
        title = new HashMap();
        title.put("size", "12");
        title.put("title", 
          "E-Way Bill No. : " + rs1.getString("ewaybill_no"));
        title.put("width", "60");
        title.put("align", "l");
        titles.add(title);
        title = new HashMap();
        title.put("size", "12");
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
        title.put("size", "12");
        title.put("title", "Transport : " + rs1.getString("transport"));
        title.put("width", String.valueOf(contentHalfWidth - 10.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 10.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "LR.Date   : " + rs1.getString("lrdate"));
        title.put("width", String.valueOf((contentHalfWidth - 10.0F) / 2.0F));
        title.put("align", "l");
        titles.add(title);
        currentYp = getCurrentYPos();
        createTitle(contentHalfWidth + 10.0F, getCurrentYPos(), titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "LR.No.: " + rs1.getString("lrno"));
        title.put("width", String.valueOf((contentHalfWidth - 10.0F) / 4.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 130.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Weight     : " + rs1.getString("weight"));
        title.put("width", 
          String.valueOf(getContentWidth() / 2.0F / 3.0F - 30.0F));
        title.put("align", "l");
        titles.add(title);
        currentYp = getCurrentYPos();
        createTitle(contentHalfWidth + 10.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "   Freight :  " + rs1.getString("freight"));
        title.put("width", 
          String.valueOf(getContentWidth() / 2.0F / 3.0F - 30.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(contentHalfWidth + 120.0F, currentYp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "   Bales: " + rs1.getString("noofbales"));
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
        createTitle(30.0F, gyp, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", rs1.getString("lstatecode"));
        title.put("width", String.valueOf(getContentWidth() / 4.0F));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(contentHalfWidth / 2.0F + 10.0F, gyp, titles);
        
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
        createTitle(contentHalfWidth / 2.0F + 270.0F, gyp, titles);
        
        if (addrLineY < getCurrentYPos()) {
          setCurrentYPos(addrLineY);
        }
        drawLine(getPageMarginLeft(), getCurrentYPos() - 5.0F, 
          getPageWidth() - getPageMarginRight(), 
          getCurrentYPos() - 5.0F);
        drawLine(contentHalfWidth + 5.0F, firstY + 2.0F, 
          contentHalfWidth + 5.0F, getCurrentYPos() - 5.0F);
        changeYPosBy(5.0F);
        



        float pageWidth = getPageWidth() - getPageMarginLeft() - 
          getPageMarginRight();
        float snoWidth = pageWidth * 5.0F / 100.0F;
        float descWidth = pageWidth * 49.0F / 100.0F;
        float hsnWidth = pageWidth * 11.0F / 100.0F;
        float mtrWidth = pageWidth * 7.0F / 100.0F;
        float qtyWidth = pageWidth * 6.0F / 100.0F;
        float rateWidth = pageWidth * 10.0F / 100.0F;
        float amtWidth = pageWidth * 12.0F / 100.0F;
        ArrayList<HashMap<String, String>> c = new ArrayList();
        HashMap<String, String> c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(snoWidth));
        c1.put("caption", "SNo");
        c1.put("name", "sd_sno");
        c1.put("align", "c");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(descWidth));
        c1.put("caption", "Description");
        c1.put("name", "itemdescription");
        c1.put("align", "l");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(hsnWidth));
        c1.put("caption", "HSN");
        c1.put("name", "hsncode");
        c1.put("align", "c");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(mtrWidth));
        c1.put("caption", "Mtrs");
        c1.put("name", "mtrs");
        c1.put("align", "c");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(rateWidth));
        c1.put("caption", "Rate");
        c1.put("name", "rate");
        c1.put("align", "r");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(qtyWidth));
        c1.put("caption", "Qty");
        c1.put("name", "quantity");
        c1.put("align", "c");
        c.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(amtWidth));
        c1.put("caption", "Amount");
        c1.put("name", "amount");
        c1.put("align", "r");
        c.add(c1);
        HashMap<String, String> v = new HashMap();
        v.put("so_action", "600");
        float cyp = getCurrentYPos();
        float typ = createTableLines(c, getPageHeight() - (
          getPageHeight() - cyp) - getPageMarginBottom() - 
          getPageMarginTop() - 130.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), getCurrentYPos());
        
        float cy = createTableHeader(c, 25.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), cyp, 1, false, 12.0F);
        setCurrentYPos(cy);
        
        pstmt = conn
        
          .prepareStatement("select @rowno:=@rowno+1 sd_sno,d.* from (select  p1.product_name itemdescription,concat('(',descr,')') descr,p1.hsn_code hsncode, case when f1.mtrs =0 then '' else f1.mtrs end mtrs,' ' unit,format(round(rate,2),2,'en_IN') rate,format(round(amount,2),2,'en_IN') amount,pcs as quantity from dc_det f1,product_mast p1 where f1.design_code=p1.product_code and f1.invoice_code=" + 
          invoiceNo + 
          ") d inner join (SELECT @rowno:=0) sno on 1=1");
        




        rs = pstmt.executeQuery();
        cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), getCurrentYPos(), 1, false, 12.0F);
        setCurrentYPos(cy);
        rs.close();
        pstmt.close();
        pstmt = null;
        
        pstmt = conn
          .prepareStatement("select '' sd_sno,'E. & O.E.                                                             Total ' itemdescription,'' descr,'' hsncode,ifnull(sum(pcs),0) quantity,'' unit,'' rate,format(ifnull(sum(amount),0),2,'en_IN') amount,ifnull(sum(pcs),0) as pcs,ifnull(sum(mtrs),0) mtrs from dc_det f1 where invoice_code=" + 
          invoiceNo);
        pstmt.clearParameters();
        
        rs = pstmt.executeQuery();
        cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - 
          getPageMarginLeft() - getPageMarginRight(), 
          getPageMarginLeft(), typ + 17.0F, 1, false, 12.0F);
        setCurrentYPos(cy - 2.0F);
        rs.close();
        pstmt.close();
        pstmt = null;
        
        drawLine(getPageMarginLeft(), typ + 15.0F, getPageMarginLeft() + 
          snoWidth + descWidth + hsnWidth + mtrWidth + 
          rateWidth + amtWidth + qtyWidth, typ + 15.0F);
        
        ArrayList<HashMap<String, String>> c2 = new ArrayList();
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", 
          String.valueOf(snoWidth + descWidth + hsnWidth + 
          mtrWidth + qtyWidth + rateWidth));
        c1.put("caption", "");
        c1.put("name", "itemdescription");
        c1.put("align", "r");
        c1.put("font", "b");
        
        c2.add(c1);
        c1 = new HashMap();
        c1.put("margin", "2");
        c1.put("width", String.valueOf(amtWidth));
        c1.put("caption", "");
        c1.put("name", "amount");
        c1.put("align", "r");
        c1.put("font", "b");
        
        c2.add(c1);
        







        drawLine(getPageMarginLeft() + snoWidth + descWidth, typ, 
          getPageMarginLeft() + snoWidth + descWidth + hsnWidth + 
          mtrWidth + rateWidth + amtWidth + qtyWidth, 
          typ);
        












        printBold=true;
        createParagraph("", "Notes: " + rs1.getString("note"), 250.0F, 30.0F, 
          cy - 12.0F, 0.0F, 12);
        printBold=false;
        if (rs1.getDouble("discount_per") > 0.0D)
        {




          pstmt = 
            conn.prepareStatement("select '' sd_sno,concat(disc_text,' @ ',disc_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(discount,2,'en_IN') amount,'' pcs,'' mtrs from dc f1 where f1.invoice_code=" + 
            invoiceNo);
          
          pstmt.clearParameters();
          rs = pstmt.executeQuery();
          
          cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() - 
            getPageMarginLeft() - getPageMarginRight(), 
            getPageMarginLeft(), cy, 1, false, 12.0F);
          rs.close();
          pstmt.close();
          
          pstmt = null;
          rs = null;
        }
        









        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Taxable Value ");
        title.put("width", 
          String.valueOf(mtrWidth + rateWidth + qtyWidth));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageWidth() - getPageMarginRight() - (
          amtWidth + mtrWidth + rateWidth + qtyWidth), 
          typ - 15.0F, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", rs1.getString("gross_amt"));
        title.put("width", String.valueOf(amtWidth - 2.0F));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageWidth() - getPageMarginRight() - amtWidth, 
          typ - 15.0F, titles);
        cy = getCurrentYPos();
        
        drawLine(getPageMarginLeft(), typ - 15.0F, getPageWidth() - 
          getPageMarginRight(), typ - 15.0F);
        float initialY = 200.0F;
        float lineY = getCurrentYPos();
        float bankLineY = typ - 15.0F;
        
        if (rs1.getDouble("igst_per") > 0.0D)
        {




          pstmt = 
            conn.prepareStatement("select '' sd_sno,concat('IGST @ ',igst_per,'%')itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(igst_amount ,2,'en_IN') amount,'' pcs,'' mtrs from dc where invoice_code=" + 
            invoiceNo);
          
          pstmt.clearParameters();
          rs = pstmt.executeQuery();
          



          cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() - 
            getPageMarginLeft() - getPageMarginRight(), 
            getPageMarginLeft(), cy, 1, false, 12.0F);
          setCurrentYPos(cy);
          rs.close();
          pstmt.close();
          
          pstmt = null;
          rs = null;
          initialY = cy;
        }
        
        if (rs1.getDouble("cgst_per") > 0.0D)
        {




          pstmt = 
            conn.prepareStatement("select '' sd_sno,concat('CGST @ ',cgst_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(cgst_amount,2,'en_IN') amount,'' pcs,'' mtrs from dc where invoice_code=" + 
            invoiceNo);
          pstmt.clearParameters();
          rs = pstmt.executeQuery();
          
          cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() - 
            getPageMarginLeft() - getPageMarginRight(), 
            getPageMarginLeft(), getCurrentYPos(), 1, false, 12.0F);
          setCurrentYPos(cy);
          rs.close();
          pstmt.close();
          
          pstmt = null;
          rs = null;
          initialY = cy;
        }
        
        if (rs1.getDouble("sgst_per") > 0.0D)
        {




          pstmt = 
            conn.prepareStatement("select '' sd_sno,concat('SGST @ ',sgst_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(sgst_amount,2,'en_IN') amount,'' pcs,'' mtrs from dc where invoice_code=" + 
            invoiceNo);
          
          pstmt.clearParameters();
          rs = pstmt.executeQuery();
          
          cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() - 
            getPageMarginLeft() - getPageMarginRight(), 
            getPageMarginLeft(), getCurrentYPos(), 1, false, 12.0F);
          setCurrentYPos(cy);
          rs.close();
          pstmt.close();
          
          pstmt = null;
          rs = null;
          initialY = cy;
        }
        if ((rs1.getDouble("courier_charges") > 0.0D) && ("P".equals(rs1.getString("paid_to_pay")))) {
          pstmt = 
            conn.prepareStatement("select '' sd_sno,'Freight' itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,'" + rs1.getString("courier_charges") + "' amount,'' pcs,'' mtrs from ddual ");
          pstmt.clearParameters();
          rs = pstmt.executeQuery();
          
          cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() - 
            getPageMarginLeft() - getPageMarginRight(), 
            getPageMarginLeft(), cy, 1, false, 12.0F);
          rs.close();
          pstmt.close();
          
          pstmt = null;
          rs = null;
        }
        drawLine(getPageMarginLeft(), 90.0F, getPageWidth() - 
          getPageMarginRight(), 90.0F);
        float nyp = getCurrentYPos();
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Bank Name  : " + rs1.getString("bankname"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(30.0F, bankLineY, titles);
        
        titles.clear();
        
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "A/c No.        : " + rs1.getString("acno"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F - 100.0F));
        title.put("align", "l");
        titles.add(title);
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "IFSC Code   : " + rs1.getString("ifsccode"));
        title.put("width", String.valueOf(getContentWidth() / 2.0F - 100.0F));
        title.put("align", "l");
        titles.add(title);
        createTitle(30.0F, getCurrentYPos(), titles);
        nyp = getCurrentYPos();
        
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", "Net Amount:");
        title.put(
          "width", 
          String.valueOf(snoWidth + descWidth + hsnWidth + 
          mtrWidth + qtyWidth + rateWidth));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        
        cy = nyp;
        createTitle(getPageMarginLeft(), 90.0F, titles);
        titles.clear();
        title = new HashMap();
        title.put("size", "12");
        title.put("title", rs1.getString("sh_net_amount"));
        title.put("width", String.valueOf(amtWidth - 2.0F));
        title.put("align", "r");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageWidth() - getPageMarginRight() - amtWidth, 
          90.0F, titles);
        
        drawLine(getPageMarginLeft() + snoWidth + descWidth + hsnWidth + 
          mtrWidth + qtyWidth + rateWidth, typ, 
          getPageMarginLeft() + snoWidth + descWidth + hsnWidth + 
          mtrWidth + qtyWidth + rateWidth, 90.0F);
        
        drawLine(getPageMarginLeft() + snoWidth + descWidth + hsnWidth, 
          typ, getPageMarginLeft() + snoWidth + descWidth + 
          hsnWidth, 90.0F);
        
        java.math.BigDecimal amt = 
          java.math.BigDecimal.valueOf(rs1.getDouble("wordnetamt"));
        String amountInWords = "Rupees " + 
          NumberToWord.convertNumberToWords(amt) + " Only.";
        printBold = true;
        createParagraph("", amountInWords, 175.0F, 30.0F, 78.0F, 0.0F, 12);
        printBold = false;
        






        titles.clear();
        title = new HashMap();
        title.put("size", "10");
        title.put("title", "For " + rs1.getString("comp_name"));
        title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        title = new HashMap();
        title.put("size", "8");
        title.put("title", " ");
        title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
        title.put("align", "r");
        titles.add(title);
        title = new HashMap();
        title.put("size", "8");
        title.put("title", " ");
        title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
        title.put("align", "r");
        titles.add(title);
        title = new HashMap();
        title.put("size", "8");
        title.put("title", " ");
        title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
        title.put("align", "r");
        titles.add(title);
        title = new HashMap();
        title.put("size", "9");
        title.put("title", "Authorized Signatory");
        title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getContentWidth() / 3.0F + 75.0F, 90.0F, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "8");
        title.put("title", "");
        title.put("width", String.valueOf(descWidth));
        title.put("align", "l");
        title.put("font", "b");
        titles.add(title);
        cy = getCurrentYPos();
        createTitle(getPageMarginLeft() + snoWidth, 45.0F, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "8");
        title.put("title", 
          "Goods once sold cannot be taken back or exchanged.");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageMarginLeft(), 30.0F, titles);
        
        titles.clear();
        title = new HashMap();
        title.put("size", "8");
        title.put("title", "Subject to Salem Jurisdiction.");
        title.put("width", String.valueOf(getContentWidth() / 2.0F));
        title.put("align", "c");
        title.put("font", "b");
        titles.add(title);
        createTitle(getPageMarginLeft() + getContentWidth() / 2.0F, 30.0F, 
          titles);
        
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
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (rs1 != null) {
          rs1.close();
        }
        if (pstmt1 != null) {
          pstmt1.close();
        }
        if (conn != null) {
          conn.close();
        }
      }
      catch (SQLException localSQLException) {}
    }
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
