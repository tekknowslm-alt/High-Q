package com.hiq.trade.resource;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import com.hiq.trade.util.LedgerReportPrint;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.StreamingOutput;
import javax.ws.rs.core.UriInfo;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.glassfish.jersey.uri.UriComponent;

import com.hiq.trade.transaction.ScanItems;
import com.hiq.trade.util.*;

@Path("invoice")
public class InvoiceResource {
	@Context
	HttpServletRequest req;
	@Context
	HttpServletResponse res;

	@Path("/invoiceprint")	@GET
	@Produces("application/pdf")
	public StreamingOutput getInvoicePrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WritePDFImpl pdf = new WritePDFImpl();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/duplicateprint")	@GET
	@Produces("application/pdf")
	public StreamingOutput getDuplicatePrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteDuplicate pdf = new WriteDuplicate();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/transportprint")	@GET
	@Produces("application/pdf")
	public StreamingOutput getTransportPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteTrans pdf = new WriteTrans();					
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/salesretprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getSalesRetPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteSalesReturn pdf = new WriteSalesReturn();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/purcretprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getPurcRetPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WritePurcReturn pdf = new WritePurcReturn();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/dcprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getdcPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteDCPrint pdf = new WriteDCPrint();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/purcinvprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput gePurcInvPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					 WritePurcInv pdf = new WritePurcInv();			
				 	pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/voucherprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput geVoucherPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteVoucher pdf = new WriteVoucher();			
				 	pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	
	@Path("/salesorderprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput geSalesOrderPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteSalesOrder pdf = new WriteSalesOrder();			
				 pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/purcorderprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput gePurcOrderPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WritePurcOrder pdf = new WritePurcOrder();			
				 pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/weavervoucherprint")
	@GET
	@Produces("application/pdf")	
	public StreamingOutput geWeaverVoucherPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WeaverPaymentVoucher pdf = new WeaverPaymentVoucher ();			
				 	pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/labelprint")
	@GET
	@Produces("text/plain")
	public String sendLabelToPrint(@QueryParam("productcode") String productcode,
			@QueryParam("stickers") String stickers, @QueryParam("slno") String slno, @QueryParam("mtrs") String mtrs,
			@QueryParam("ucode") String ucode, @Context final UriInfo uriInfo) {
		String guid = "";
		try {
			LabelPrint pdf = new LabelPrint();
			guid = pdf.PDFGen(productcode, stickers, slno, mtrs, ucode, null);
			if (!"".equals(guid)) {

				PrintService service = PrintServiceLookup.lookupDefaultPrintService();
				String defServiceName = service.getName();

				/*
				 * String serviceToPrint="CutePDF Writer";
				 * 
				 * if(!defServiceName.equals(serviceToPrint)){ PrintRequestAttributeSet pras1 =
				 * new HashPrintRequestAttributeSet(); DocFlavor flavor1 =
				 * DocFlavor.INPUT_STREAM.AUTOSENSE; // FILE IS .txt TYPE PrintService
				 * printService[] = PrintServiceLookup.lookupPrintServices(flavor1, pras1);
				 * for(int i=0;i<printService.length;i++){ String
				 * serviceName=printService[i].getName(); System.out.println(serviceName);
				 * if(serviceName.equals(serviceToPrint)){ service=printService[i]; } } }
				 */
				System.out.println(guid + " " + defServiceName);
				/*
				 * FileInputStream in = new FileInputStream("d:\\tmpprint\\" +guid +".pdf"); Doc
				 * doc = new SimpleDoc(in, DocFlavor.INPUT_STREAM.AUTOSENSE, null);
				 */
				try {
					pdf.printPDF("c:\\tmpprint\\" + guid + ".pdf", service, "LabelPrint");
					// service.createPrintJob().print(doc, new HashPrintRequestAttributeSet());
					System.out.println("sent to printer");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return guid;
	}

	@Path("/packingslip")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getPackingSlip(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WritePackingSlip pdf = new WritePackingSlip();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}
	@Path("/envelope")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getEnvelope(@Context final UriInfo uriInfo) {		
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteEnvelope pdf = new WriteEnvelope();
					
							
					pdf.writeSimpleDocument(queryParams.getFirst("ledgercode"), queryParams.getFirst("addresstype"),out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/lorryinvoice")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getLorryInvoice(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteLorryInvoice pdf = new WriteLorryInvoice();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), queryParams.getFirst("toinvoiceno"),
							queryParams.getFirst("companycode"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/sizingcontrol")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getSizingControl(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					GenerateSizingControlChart pdf = new GenerateSizingControlChart();
					pdf.writeSimpleDocument(queryParams.getFirst("sizingno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/barcodeprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getBarcodes(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					BarcodePrint pdf = new BarcodePrint();
					pdf.PDFGen(queryParams.getFirst("productcode"), queryParams.getFirst("stickers"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}

	@Path("/barcodetoprint")
	@GET
	@Produces("text/plain")
	public String sendBarcodeToPrint(@QueryParam("productcode") String productcode,
			@QueryParam("stickers") String stickers, @Context final UriInfo uriInfo) {
		String guid = "";
		try {
			BarcodePrint pdf = new BarcodePrint();
			guid = pdf.PDFGen(productcode, stickers, null);
			if (!"".equals(guid)) {
				PrintService service = PrintServiceLookup.lookupDefaultPrintService();
				String defServiceName = service.getName();// "Bar Code Printer T-9650 Plus On SRIKRISHNASILKS";

				// String defServiceName=service.getName();
				// System.out.println(defServiceName);
				// String serviceToPrint="Bar Code Printer T-9650 Plus On SRIKRISHNASILKS";
				String serviceToPrint = "\\\\SRIKRISHNASILKS\\Bar Code Printer T-9650 Pro";

				if (!defServiceName.equals(serviceToPrint)) {
					PrintRequestAttributeSet pras1 = new HashPrintRequestAttributeSet();
					DocFlavor flavor1 = DocFlavor.INPUT_STREAM.AUTOSENSE; // FILE IS .txt TYPE
					PrintService printService[] = PrintServiceLookup.lookupPrintServices(flavor1, pras1);
					for (int i = 0; i < printService.length; i++) {
						String serviceName = printService[i].getName();
						System.out.println(serviceName);
						if (serviceName.equals(serviceToPrint)) {
							service = printService[i];
						}
					}
				}
				/*
				 * FileInputStream in = new FileInputStream("d:\\tmpprint\\" +guid +".pdf"); Doc
				 * doc = new SimpleDoc(in, DocFlavor.INPUT_STREAM.AUTOSENSE, null);
				 */
				try {
					pdf.printPDF("c:\\tmpprint\\" + guid + ".pdf", service, "BarcodePrint");
					// service.createPrintJob().print(doc, null);
					System.out.println("Print Sent");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return guid;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String addScannedItem(@QueryParam("productcode") String productcode, @QueryParam("qty") String qty,
			@Context final UriInfo uriInfo) {
		String result = "";
		try {
			System.out.println(productcode);
			ScanItems s = ScanItems.getInstance();
			result = s.addScannedItem(productcode, qty);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Path("/invoicelabelprint")
	@GET
	@Produces("application/pdf")
	public StreamingOutput getInvoiceLabelPrint(@Context final UriInfo uriInfo) {
		return new StreamingOutput() {

			@Override
			public void write(OutputStream out) throws IOException, WebApplicationException {
				try {
					MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),
							true);
					String loginId = (String) req.getSession().getAttribute("LOGIN_ID");
					if (loginId != null) {
						queryParams.add("login_id", loginId);
					}
					String userId = (String) req.getSession().getAttribute("USER_ID");
					if (userId != null) {
						queryParams.add("user_id", userId);
					}
					WriteAddressLabel pdf = new WriteAddressLabel();
					pdf.writeSimpleDocument(queryParams.getFirst("invoiceno"), out);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
	}


 
    @Path("/ledgerprint")
    @GET
    @Produces("application/pdf")
    public StreamingOutput getLedgerReport(@Context final UriInfo  uriInfo) {
        return new StreamingOutput() {

@Override
public void write(OutputStream out) throws IOException,
WebApplicationException {
try{
MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),true);
String loginId=(String)req.getSession().getAttribute("LOGIN_ID");
if(loginId!=null){
queryParams.add("login_id", loginId);
}
String userId=(String)req.getSession().getAttribute("USER_ID");
if(userId!=null){
queryParams.add("user_id", userId);
}
String userCode=(String)req.getSession().getAttribute("MASTER_CODE");
if(userCode!=null){
queryParams.add("mastercode", userCode);
}
String primaryUser=(String)req.getSession().getAttribute("PRIMARY_USER");
if(userCode!=null){
queryParams.add("primaryuser", primaryUser);
}

LedgerReportPrint pdf=new LedgerReportPrint();
       pdf.PDFGen(queryParams,out); 
}catch(Exception e){
e.printStackTrace();
}

}
};
    }

 @Path("/gstfiling")
    @GET
    @Produces("application/json")
    public StreamingOutput generateGSTFilingJSON(@Context final UriInfo  uriInfo) {
        return new StreamingOutput() {
@Override
public void write(OutputStream out) throws IOException,WebApplicationException {
try{
MultivaluedMap<String, String> queryParams = UriComponent.decodeQuery(uriInfo.getRequestUri(),true);
String loginId=(String)req.getSession().getAttribute("LOGIN_ID");
if(loginId!=null){
queryParams.add("login_id", loginId);
}
String userId=(String)req.getSession().getAttribute("USER_ID");
if(userId!=null){
queryParams.add("user_id", userId);
}
GSTFilingUtil g=new GSTFilingUtil();
g.generateGSTRJSON(queryParams.getFirst("fromdate"), queryParams.getFirst("todate"),queryParams.getFirst("companycode"), out);
}catch(Exception e){
e.printStackTrace();
}
}
};
    }
}