package com.woc.common;

import java.io.EOFException;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.springframework.orm.hibernate4.HibernateOptimisticLockingFailureException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;


@Component
@Provider
public class GenericExceptionMapper implements ExceptionMapper<Throwable> {

    @Override
    public Response toResponse(Throwable th) {
        if (th instanceof AccessDeniedException) {
            return Response.status(Response.Status.UNAUTHORIZED).entity(
                            "{ \"error\": \"Full authentication is required to access this resource\" }").type(
                            MediaType.APPLICATION_JSON).build();
        } else if (th instanceof AppException) {
            return Response.status(Response.Status.BAD_REQUEST).entity(
                            "{ \"error\": \"" + th.getMessage() + "\" }").type(
                            MediaType.APPLICATION_JSON).build();
        }else if (th instanceof EOFException) {
            return Response.status(Response.Status.BAD_REQUEST).entity(
                            "{ \"error\": \"" + th.getMessage() + "\" }").type(
                            MediaType.APPLICATION_JSON).build();
        } else if (th instanceof ClientErrorException || th instanceof NotFoundException) {
            String errorMessage = "";
            if (th.getMessage() != null)
                errorMessage = th.getMessage();
            else
                errorMessage = "The requested URL was not found";
            return Response.status(Response.Status.NOT_FOUND).entity(
                            "{ \"error\": \"" + errorMessage + "\" }").type(
                            MediaType.APPLICATION_JSON).build();
        }else if(th instanceof HibernateOptimisticLockingFailureException){ 
            String errorMessage ="Something went wrong. Please try again later.";
            return Response.status(Response.Status.CONFLICT).entity(
                            "{ \"error\": \"" + errorMessage + "\" }").type(
                            MediaType.APPLICATION_JSON).build();     
        }else{
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(
                            "{ \"error\": \"" + th.getMessage() + "\" }").type(
                            MediaType.APPLICATION_JSON).build();
        }
    }

}
