package admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.ProductModel;
import model.UserModel;
import service.IProductService;
import utils.HttpUtil;
import utils.SessionUtil;

/**
 * Servlet implementation class ProductAPI
 */
public class ProductAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IProductService productService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel model = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		model.setCreatedBy(userModel.getUsername());
		//categoryModel.setCreatedBy(((UserModel)SessionUtil.getInstance().getValue(request, "USERMODEL")).getUsername());
		model = productService.save(model);
		mapper.writeValue(response.getOutputStream(), model);
	}

}
