package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.ProductModel;
import paging.IPageble;
import paging.PageRequest;
import service.ICategoryService;
import service.IProductService;
import sort.Sorter;
import utils.FormUtil;
import utils.MessageUtil;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet(urlPatterns = {"/admin-product"})
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private IProductService productService;
	@Inject
	private ICategoryService categoryService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		String view = "";
		if (model.getType().equals("list")) {
			IPageble pageable = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(productService.findAll(pageable));
			model.setTotalItem(productService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			view = "/views/admin/product/product_list.jsp";
		}
		else if(model.getType().equals("edit")) {
				if (model.getId() != null) {
					model = productService.findOne(model.getId());
				}
				else {
					
				}
				request.setAttribute("categories", categoryService.findAll());
				view = "/views/admin/product/product_edit.jsp";
		}
		MessageUtil.showMessage(request);
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
