package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GetMutterListLogic;
import model.Mutter;
import model.PostMutterLogic;
import model.User;


@WebServlet("/Main")
public class Main extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, 
		  HttpServletResponse response) 
				  throws ServletException, IOException {
	  

	   //ここからつぶやきリスト
	  
    // つぶやきリストを取得して、リクエストスコープに保存
    GetMutterListLogic getMutterListLogic = new GetMutterListLogic();
    List<Mutter> mutterList = getMutterListLogic.execute();
    request.setAttribute("mutterList", mutterList);

    // ログインしているか確認するため
    // セッションスコープからユーザー情報を取得
    HttpSession session = request.getSession();
    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser == null) { // ログインしていない
    // リダイレクト
      response.sendRedirect("index.jsp");
    } else { // ログイン済み
    	
    	//ここまでつぶやきリスト
    	
    	//ここから評価ボタン
    	
//		// アプリケーションスコープに保存されたサイト評価を取得
//  	  ServletContext application = this.getServletContext();
//  	  SiteEV siteEV = (SiteEV) application.getAttribute("SiteEV");
//
//  	   // サイト評価の初期化（初回リクエスト時実行）
//  	   if (siteEV == null) {
//  	     siteEV = new SiteEV();
//  	   }
//
//  	   // リクエストパラメータの取得
//  	   request.setCharacterEncoding("UTF-8");
//  	   String action = request.getParameter("action");
//
//  	   // サイトの評価処理（初回リクエスト時は実行しない）
//  	   SiteEVLogic siteEVLogic = new SiteEVLogic();
//  	   if (action != null && action.equals("like")) {
//  	     siteEVLogic.like(siteEV);
//  	   } 
//  	   //スコープにサイト評価を保存
//  	   application.setAttribute("SiteEV", siteEV);
  	   

  	   
  	   //ここまで評価ボタン
    	
    	
    // フォワード
      RequestDispatcher d =
    		  request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
      d.forward(request, response);
    }
  }
  
  protected void doPost(HttpServletRequest request, 
		  HttpServletResponse response) 
				  throws ServletException, IOException {
    // リクエストパラメータの取得
    request.setCharacterEncoding("UTF-8");
    String text = request.getParameter("text");

    // 入力値チェック
    if (text != null && text.length() != 0) {
      // セッションスコープに保存されたユーザー情報を取得
      HttpSession session = request.getSession();
      User loginUser = (User) session.getAttribute("loginUser");

      // つぶやきをつぶやきリストに追加
      Mutter mutter = new Mutter(loginUser.getName(), text);
      PostMutterLogic postMutterLogic = new PostMutterLogic();
      postMutterLogic.execute(mutter);
    } else {
      // エラーメッセージをリクエストスコープに保存
      request.setAttribute("errorMsg", "つぶやきが入力されていません");
    }

    // つぶやきリストを取得して、リクエストスコープに保存
    GetMutterListLogic getMutterListLogic = new GetMutterListLogic();
    List<Mutter> mutterList = getMutterListLogic.execute();
    request.setAttribute("mutterList", mutterList);

    // フォワード
    RequestDispatcher d = 
    		request.getRequestDispatcher("/WEB-INF/jsp/main.jsp");
    d.forward(request, response);
  }
}