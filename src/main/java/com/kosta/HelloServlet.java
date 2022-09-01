package com.kosta;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(description = "처음 만드는 서블릿", urlPatterns = { "/HelloServlet" })
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//컨텐츠 타입 선언 및 한글설정
		response.setContentType("text/html;charset=UTF-8");
		
		//웹브라우저 출력을 위한 PrintWriter 객체 확보
		PrintWriter out = response.getWriter();
		
		//HTML형식으로 브라우저 출력 컨텐츠 작성
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><title>Hello Servlet</title>");
		out.println("<meta charset='UTF-8'></head>");
		
		out.println("<body><h1>hello servelt 호출성공</h1>");
		out.println("</body></html>");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
