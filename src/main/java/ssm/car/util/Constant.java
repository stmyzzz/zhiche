package ssm.car.util;

public class Constant {

	public static final int MB_PAGE_SIZE = 7;
	public static final int MU_PAGE_SIZE = 15;
	public static final int PW_PAGE_SIZE = 12;
	public static final int C_PAGE_SIZE = 3;
	public static final int UO_PAGE_SIZE = 3;
	public static final String UN_DO ="未发货";
	public static final String UN_COMMENT ="待评价";
	public static final String EN_COMMENT ="已评价";
    //在没有login的情况下也允许登录的界面
	public static final String[] NoFilter_Pages=new String[]{"/userReg.do","/index.do","/CarView.do","/addGoodsInCart.do"
			,"/removeGoodsFromCart.do","/productList.do",
			"/addCarOrder","/commentPage.do","/addComment.do","/reg.do","/addTopicPage.do" //1
			,"/login.do","/addUserPage.do","/cartPage.do","/productListPage.do"
			,"/oderPage.do","/shoppingResult.do","/addTopic.do","/addTopic.do","/manaTopic.do","/tcommentPage.do"
			,"/updateUserPage.do","/updatePwdPage.do","/loginCheck.do","/addTcomment.do","/TopicView.do"
			,"/updateUser.do","/logout.do","/userOrder.do"
			,"/updatePwd.do","/backLogin.do","/cleanCart.do","/findinfor.do","/updateImg.do"
			,"/checkStore.do","allcar"};
}
