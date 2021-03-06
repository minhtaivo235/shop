package admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.CategoryModel;
import model.UserModel;
import service.ICategoryService;
import utils.HttpUtil;
import utils.SessionUtil;

/**
 * Servlet implementation class CategoryAPI
 */
@WebServlet(urlPatterns = {"/api-admin-category"})
public class CategoryAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private ICategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryAPI() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		categoryModel.setCreatedBy(userModel.getUsername());
		//categoryModel.setCreatedBy(((UserModel)SessionUtil.getInstance().getValue(request, "USERMODEL")).getUsername());
		categoryModel = categoryService.save(categoryModel);
		mapper.writeValue(response.getOutputStream(), categoryModel);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel updateCategory =  HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		updateCategory.setModifiedBy(userModel.getUsername());
//		updateCategory.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUsername());
		updateCategory = categoryService.update(updateCategory);
		mapper.writeValue(response.getOutputStream(), updateCategory);
	}
	
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8"); // client chuyển lên sever k bị lỗi font
		resp.setContentType("application/json"); // sever định nghĩa kiểu dữ liệu trả về json
		CategoryModel categoryModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
		categoryService.delete(categoryModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}

}
