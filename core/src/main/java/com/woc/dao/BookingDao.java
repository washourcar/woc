package com.woc.dao;

import java.util.List;

import javax.transaction.Transactional;

import com.woc.model.Booking;

public interface BookingDao extends GenericDao<Booking, String> {
	
	@Transactional
	List<Booking> getAll();
	
	@Transactional
	Booking save(Booking booking);
	
	@Transactional
	Booking get(String id);

	@Transactional
	Booking getBooking(String bookingId);
	
	@Transactional
	void removeBooking(String bookingId);
}
