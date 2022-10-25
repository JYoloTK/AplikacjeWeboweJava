package com.jsfcourse.calc;

import javax.inject.Inject;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

@Named
@RequestScoped
//@SessionScoped
public class KredytBB {
	private Integer y, z;
	private Double result, x;

	@Inject
	FacesContext ctx;

	public Double getX() {
		return (x);
	}

	public void setX(Double x) {
		this.x = x;
	}
	
	public Integer getZ() {
		return (z);
	}

	public void setZ(Integer z) {
		this.z = z;
	}

	public Integer getY() {
		return (y);
	}

	public void setY(Integer y) {
		this.y = y;
	}

	public Double getResult() {
		return result;
	}

	public void setResult(Double result) {
		this.result = result;
	}

	public boolean doTheMath() {
//		try {
//			double x = Double.parseDouble(this.x);
//			double y = Double.parseDouble(this.y);
//			double z = Double.parseDouble(this.z);

			result = (x / z) + ((x / z) * (y / 100));
			return true;

//			ctx.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Operacja wykonana poprawnie", null));
//			return true;
//		} catch (Exception e) {
//			ctx.addMessage(null,
//					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd podczas przetwarzania parametrów", null));
//			return false;
//		}
	}

	// Go to "showresult" if ok
	public String calc() {
		if (doTheMath()) {
			return "showresult";
		}
		return null;
	}

	// Put result in messages on AJAX call
	public String calc_AJAX() {
		if (doTheMath()) {
			ctx.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Miesięczna rata: " + result, null));
		}
		return null;
	}

	public String info() {
		return "info";
	}
}
