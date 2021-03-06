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
import paging.IPageble;
import paging.PageRequest;
import service.ICategoryService;
import sort.Sorter;
import utils.FormUtil;
import utils.MessageUtil;

/**
 * Servlet implementation class AdminCategoryController
 */
@WebServlet(urlPatterns = {"/admin-category"})
public class AdminCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private ICategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, request);
		String view = "";
		if (categoryModel.getType().equals("list")) {
			IPageble pageable = new PageRequest(categoryModel.getPage(), categoryModel.getMaxPageItem(), new Sorter(categoryModel.getSortName(), categoryModel.getSortBy()));
			categoryModel.setListResult(categoryService.findAll(pageable));
			categoryModel.setTotalItem(categoryService.getTotalItem());
			categoryModel.setTotalPage((int) Math.ceil((double) categoryModel.getTotalItem() / categoryModel.getMaxPageItem()));
			view = "/views/admin/category/category_list.jsp";
		}
		else if(categoryModel.getType().equals("edit")) {
				if (categoryModel.getId() != null) {
					categoryModel = categoryService.findOne(categoryModel.getId());
				}
				else {
					
				}
				view = "/views/admin/category/category_edit.jsp";
		}
		MessageUtil.showMessage(request);
		request.setAttribute("categories", categoryModel);
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
