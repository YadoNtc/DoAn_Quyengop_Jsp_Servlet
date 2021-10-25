package util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import model.DonateDetailModel;

public class PaymentServices {

	private static final String CLIENT_ID = "AZoFLeSE966zboQa8vyRxhKgLi5v5B0mqz8pFeQTHZdWixkoj51MahWHo5uARTex0vqs34dHW4c87jVd";
	private static final String CLIENT_SECRET = "EFYipNnhtDlzSaTEtO-1uS99QXIueWN8_RXDoknjOSfnLPFnIFEaKB7xQOhok87XtNd_4g8rbZrcwI4L";
	private static final String MODE = "sandbox";
	

	public String authorizePayment(DonateDetailModel detailModel) throws PayPalRESTException {
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(detailModel);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);

		return getApprovalLink(approvedPayment);
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}
		return approvalLink;
	}

	private List<Transaction> getTransactionInformation(DonateDetailModel detailModel) {
		//Details details = new Details();
		//details.setSubtotal(detailModel.getSubTotal());
		//details.setShipping(detailModel.getShipping());
		//details.setTax(detailModel.getTax());
		DecimalFormat df = new DecimalFormat("###,###.##");
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(df.format(detailModel.getAmoutMoney()));
		//amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("Quyên góp");

		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();

		Item item = new Item();
		item.setCurrency("USD");
		//item.setName(donateModel.getName());
		item.setPrice(df.format(detailModel.getAmoutMoney()));
		//item.setTax(detailModel.getTax());
		item.setQuantity("1");

		items.add(item);
		itemList.setItems(items);
		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<Transaction>();
		listTransaction.add(transaction);
		return listTransaction;
	}

	// Chuyển hướng đến các Url
	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		//String pageReturn = "http://localhost:8081/com.doan.quyengop/donateByPaypal.jsp";
		//String review_payment = "http://localhost:8081/com.doan.quyengop/review_payment";
		redirectUrls.setCancelUrl("http://localhost:8081/com.doan.quyengop/donateByPaypal.jsp");
		redirectUrls.setReturnUrl("http://localhost:8081/com.doan.quyengop/review_payment");

		return redirectUrls;
	}

	// Thông tin người thanh toán
	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("William").setLastName("Peterson").setEmail("william.peterson@company.com");

		payer.setPayerInfo(payerInfo);

		return payer;
	}

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}

}
