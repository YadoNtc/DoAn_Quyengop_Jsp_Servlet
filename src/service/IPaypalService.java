package service;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import model.DonateDetailModel;

public interface IPaypalService {
	
	Payment createdPayment(DonateDetailModel detailModel, 
			String method, String cancelUrl, String successUrl, String currency, String intent) throws PayPalRESTException;
	
	Payment excutePayment(String paymentId, String payerId) throws PayPalRESTException;
}
