package com.woc.service.impl;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Service;
import org.springframework.validation.Validator;

import com.woc.Constants;
import com.woc.common.AppException;
import com.woc.dao.BookingDao;
import com.woc.model.Booking;
import com.woc.service.BookingManager;
import com.woc.service.BookingService;
import com.woc.service.UserExistsException;
import com.woc.service.UserManager;
import com.woc.util.CommonUtil;
import com.woc.util.StringUtil;

@Service("bookingManager")
@WebService(serviceName = "BookingService", endpointInterface = "com.woc.service.BookingService")
public class BookingManagerImpl extends GenericManagerImpl<Booking, String>
		implements BookingManager, BookingService {

	private BookingDao bookingDao;
	private UserManager userManager;
	private MessageSourceAccessor messages;

	@Autowired
	public void setMessages(MessageSource messageSource) {
		messages = new MessageSourceAccessor(messageSource);
	}

	@Autowired
	public BookingManagerImpl(BookingDao bookingDao) {
		super(bookingDao);
		this.bookingDao = bookingDao;
	}

	@Autowired
	public void setBookingDao(BookingDao bookingDao) {
		this.dao = bookingDao;
		this.bookingDao = bookingDao;
	}

	@Autowired
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking getBooking(String bookingId) {
		return bookingDao.getBooking(bookingId);
	}

	/**
	 * {@inheritDoc}
	 */
	public List<Booking> getBookings() {
		return bookingDao.getAll();
	}

	/**
	 * {@inheritDoc}
	 */
	public Object saveBooking(Booking booking) throws UserExistsException, AppException {
		Calendar now = new GregorianCalendar();
		try {
			log.info("################ booking intiated #################");
			if (!StringUtil.isEmptyString(booking.getUserName())
					&& !StringUtil.isEmptyString(booking.getUserMobileNo())) {
				booking.setCreatedOn(now);
				booking.setUpdatedOn(now);
				booking.setCreatedBy(CommonUtil.getLoggedInUserName());
				booking.setUpdatedBy(CommonUtil.getLoggedInUserName());
				int bookingCount = (int) CommonUtil.getServletcontext()
						.getAttribute(Constants.BOOKING_COUNT);
				booking.setBookingId(Constants.BOOKING_ID_PREFIX
						+ Constants.BOOKING_DEFAULT_COUNT + (++bookingCount));
				booking.setBookingStatus(Constants.BOOKING_OPENED);
				booking = bookingDao.save(booking);
				CommonUtil.getServletcontext().setAttribute(
						Constants.BOOKING_COUNT, ++bookingCount);
				log.info("################ booking success waiting for SMS #################");
				userManager
						.sendUserSMS(
								booking.getUserMobileNo().contains("+91") ? booking
										.getUserMobileNo() : "+91"
										+ booking.getUserMobileNo(),
								"Hi "
										+ booking.getUserName()
										+ ",Thanks for booking in WashOurCar, we contact you ASAP.");
				/*userManager
						.sendUserSMS(
								Constants.IJAZ_MOBILE_NUMBER.contains("+91") ? Constants.IJAZ_MOBILE_NUMBER
										: "+91" + Constants.IJAZ_MOBILE_NUMBER,
								"Hey "
										+ booking.getUserName()
										+ " booked on WashOurCar, check the details and give best service.");*/
				log.info("################ SMS notification sent #################");
				log.info("################ booked #################");
				return booking;
			} else {
				return Response.status(Response.Status.BAD_REQUEST).entity(
                        "{ \"error\": \"Name, Phone number should not be empty\" }").type(
                        MediaType.APPLICATION_JSON).build();
				//throw new AppException("Name, Phone number should not be empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking updateBooking(Booking booking) throws UserExistsException {
		Calendar now = new GregorianCalendar();
		booking.setUpdatedOn(now);
		booking.setUpdatedBy(CommonUtil.getLoggedInUserName());
		booking = bookingDao.save(booking);
		return booking;
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking cancelBooking(String bookingId) throws UserExistsException {
		Booking booking = bookingDao.getBooking(bookingId);
		Calendar now = new GregorianCalendar();
		booking.setUpdatedOn(now);
		booking.setUpdatedBy(CommonUtil.getLoggedInUserName());
		booking.setBookingStatus(Constants.BOOKING_CANCELED);
		return bookingDao.save(booking);
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking closeBooking(String bookingId) throws UserExistsException {
		Booking booking = bookingDao.getBooking(bookingId);
		Calendar now = new GregorianCalendar();
		booking.setUpdatedOn(now);
		booking.setUpdatedBy(CommonUtil.getLoggedInUserName());
		booking.setBookingStatus(Constants.BOOKING_CLOSED);
		return bookingDao.save(booking);
	}

	/**
	 * {@inheritDoc}
	 */
	public void removeBooking(String bookingId) {
		bookingDao.removeBooking(bookingId);
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking getBookingById(String id) {
		return bookingDao.get(id);
	}

	/**
	 * {@inheritDoc}
	 */
	public Booking getBookingByBookingId(String bookingId) {
		return bookingDao.getBooking(bookingId);
	}

}
