package com.woc.dao.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.woc.dao.BookingDao;
import com.woc.model.Booking;

@Repository("bookingDao")
public class BookingDaoHibernate extends GenericDaoHibernate<Booking, String>
		implements BookingDao {

	/**
	 * Constructor to create a Generics-based version using Booking as the
	 * entity
	 */
	public BookingDaoHibernate() {
		super(Booking.class);
	}

	/**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public List<Booking> getAll() {
        Session sess = getSession();
        return sess.createCriteria(Booking.class).list();
    }
    
    /**
	 * {@inheritDoc}
	 */
	public Booking get(String id) {
		List bookings = getSession().createCriteria(Booking.class)
				.add(Restrictions.eq("id", id)).list();
		if (bookings.isEmpty()) {
			return null;
		} else {
			return (Booking) bookings.get(0);
		}
	}
	
	/**
     * {@inheritDoc}
     */
    @SuppressWarnings("unchecked")
    public Booking save(Booking booking) {
        Session sess = getSession();
        return (Booking) sess.merge(booking);
    }
    
	/**
	 * {@inheritDoc}
	 */
	public Booking getBooking(String bookingId) {
		List bookings = getSession().createCriteria(Booking.class)
				.add(Restrictions.eq("bookingId", bookingId)).list();
		if (bookings.isEmpty()) {
			return null;
		} else {
			return (Booking) bookings.get(0);
		}
	}

	public void removeBooking(String bookingId) {
		Booking booking = getBooking(bookingId);
		if (booking != null) {
			getSession().delete(booking);
		}
	}
}
