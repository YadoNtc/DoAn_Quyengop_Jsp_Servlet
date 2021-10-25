package service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import model.DonateDetailModel;
import service.IPaypalService;

public class PaypalService implements IPaypalService {
	
	private static final String CLIENT_ID = "AZoFLeSE966zboQa8vyRxhKgLi5v5B0mqz8pFeQTHZdWixkoj51MahWHo5uARTex0vqs34dHW4c87jVd";
	private static final String CLIENT_SECRET = "EFYipNnhtDlzSaTEtO-1uS99QXIueWN8_RXDoknjOSfnLPFnIFEaKB7xQOhok87XtNd_4g8rbZrcwI4L";
	private static final String MODE = "sandbox";
	

	@Override
	public Payment createdPayment(DonateDetailModel detailModel, 
			String method, String cancelUrl, String successUrl, String currency, String intent) throws PayPalRESTException {
		DecimalFormat df = new DecimalFormat("###,###.##");
		Amount amount = new Amount();
		amount.setCurrency(currency);
		amount.setTotal(df.format(detailModel.getAmoutMoney()));
		
		Transaction transaction = new Transaction();
		transaction.setDescription("Thanh toán quyên góp");
		transaction.setAmount(amount);
		
		List<Transaction> transactions = new ArrayList<>();
		transactions.add(transaction);
		
		Payer payer = new Payer();
		payer.setPaymentMethod(method.toString());
		
		Payment payment = new Payment();
		payment.setIntent(intent);
		payment.setPayer(payer);
		payment.setTransactions(transactions);
		
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(successUrl);
		payment.setRedirectUrls(redirectUrls);
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		
		return payment.create(apiContext);
	}

	@Override
	public Payment excutePayment(String paymentId, String payerId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment payment = new Payment();
		payment.setId(paymentId);
		
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);
		return payment.execute(apiContext, paymentExecution);
	}

}
