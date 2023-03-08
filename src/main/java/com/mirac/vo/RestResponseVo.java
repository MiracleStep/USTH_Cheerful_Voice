package com.mirac.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;


@JsonInclude(Include.NON_NULL)
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public class RestResponseVo<T> {

	private int res;

	private String info;

	private T data;

	public static <T> RestResponseVo<T> success() {
		return new RestResponseVo<T>();
	}

	public static <T> RestResponseVo<T> success(T data) {
		RestResponseVo<T> response = new RestResponseVo<T>();
		response.setData(data);
		return response;
	}


	public RestResponseVo() {
		this(1, "成功！");
	}

	public RestResponseVo(int res, String info) {
		this.res = res;
		this.info = info;
	}

	public int getRes() {
		return res;
	}

	public void setRes(int res) {
		this.res = res;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@JsonIgnore
	public Boolean isSuccessful() {
		return this.res == 1;
	}



}
