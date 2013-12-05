package com.dataentry;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: James
 * Date: 12/5/13
 * Time: 1:14 PM
 * To change this template use File | Settings | File Templates.
 */
public class DateUtil {

    public static boolean isValidDate(String date) {
        if(date == null) {
            return false;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
        } // if the format of the string provided doesn't match the format we
        // declared in SimpleDateFormat() we will get an exception
        catch (ParseException e) {
            return false;
        }

        if (!sdf.format(testDate).equals(date)) {
            return false;
        }

        return true;

    }
}
