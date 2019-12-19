package utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil { // chuyển các param trên url từ string thành json và map với model 

	@SuppressWarnings("unchecked")
	public static <T> T toModel(Class<T> tClass, HttpServletRequest request){ // kiểu trả về T chính là Model
		T object = null;
		try {
			object = tClass.newInstance();
			BeanUtils.populate(object, request.getParameterMap()); // chuyển param thành key-value[]
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {			
			System.out.println(e.getMessage());
		} 
		return object;
	}
}
