package util;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ConvertJson {

	private String value;

	public ConvertJson(String value) {
		this.value = value;
	}
	
	public static ConvertJson jsonConvertToString(BufferedReader bufferedReader) {
		StringBuilder sb = new StringBuilder();
		String line;
		try {
			while ((line = bufferedReader.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ConvertJson(sb.toString());	
	}
	
	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	
}
