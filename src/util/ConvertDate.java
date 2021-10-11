package util;

import java.sql.Timestamp;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

public class ConvertDate {

	public static void convertDate() {
		DateTimeConverter dateConverter = new DateConverter();
		dateConverter.setPatterns(new String[] {"yyyy-MM-dd"});
		ConvertUtils.register(dateConverter, Timestamp.class);
	}
}
