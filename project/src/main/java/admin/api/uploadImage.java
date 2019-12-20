package admin.api;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class uploadImage
 */
@WebServlet(urlPatterns = {"/api-admin-uploadImage"})
public class uploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("urlsource");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadImage() {
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
		final String UPLOAD_DIRECTORY = resourceBundle.getString("url");;
		String name = "";
		if(ServletFileUpload.isMultipartContent(request)){
			try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                    	File fileSaveDir = new File(UPLOAD_DIRECTORY);
                    	if (!fileSaveDir.exists()) {
                    		fileSaveDir.mkdir();
                    	}
                        name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			PrintWriter out = response.getWriter();
			out.print(name);
		}
	}
}
