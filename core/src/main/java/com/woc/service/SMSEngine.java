package com.woc.service;

import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;

/**
 * Class for sending SMS notifications
 * 
 * @author <a href="mailto:mathivanan18@gmail.com">Mathi</a>
 */
public class SMSEngine {
	private final Log log = LogFactory.getLog(SMSEngine.class);
	private String twilioAccountsId;
	private String twilioAuthToken;
	private String twilloFromNumber;

	/**
	 * Send Twilio Sms using TwilioRestClient
	 * 
	 * @param mobileNumber
	 * @param Message
	 * @return
	 * @throws MessagingException
	 */
	public Message sendTwilioSms(String mobileNumber, String message)
			throws TwilioRestException {
		log.info("#################### Sending "+message+" SMS to " +mobileNumber+ " #####################");
		TwilioRestClient client = new TwilioRestClient(twilioAccountsId,
				twilioAuthToken);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("To", mobileNumber));
		params.add(new BasicNameValuePair("From", twilloFromNumber));
		params.add(new BasicNameValuePair("Body", message));
		MessageFactory messageFactory = client.getAccount().getMessageFactory();
		Message responseMessage = messageFactory.create(params);
		log.info("#################### SMS Sent #####################");
		return responseMessage;
	}

	public String getTwilioAccountsId() {
		return twilioAccountsId;
	}

	public void setTwilioAccountsId(String twilioAccountsId) {
		this.twilioAccountsId = twilioAccountsId;
	}

	public String getTwilioAuthToken() {
		return twilioAuthToken;
	}

	public void setTwilioAuthToken(String twilioAuthToken) {
		this.twilioAuthToken = twilioAuthToken;
	}

	public String getTwilloFromNumber() {
		return twilloFromNumber;
	}

	public void setTwilloFromNumber(String twilloFromNumber) {
		this.twilloFromNumber = twilloFromNumber;
	}
}
