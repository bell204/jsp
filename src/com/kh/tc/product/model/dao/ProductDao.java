package com.kh.tc.product.model.dao;

import static com.kh.tc.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.file.model.vo.File;
import com.kh.tc.product.model.vo.Advertise;
import com.kh.tc.product.model.vo.Dealrecord;
import com.kh.tc.product.model.vo.DetailCycle;
import com.kh.tc.product.model.vo.Income;
import com.kh.tc.product.model.vo.IncomeStory;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.ProductDetail;
import com.kh.tc.product.model.vo.Reply;
import com.kh.tc.product.model.vo.product;

public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectCate(Connection con, String cate1, String cate2, String cate3, String cate4) {
		int cate_code = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectCate");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cate1);
			pstmt.setString(2, cate2);
			pstmt.setString(3, cate3);
			pstmt.setString(4, cate4);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				cate_code = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return cate_code;
	}

	public int insertProduct(Connection con, product p) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertProduct");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getP_type());
			pstmt.setInt(2, p.getCate_code());
			pstmt.setString(3, p.getP_name());
			pstmt.setString(4, p.getP_content());
			pstmt.setInt(5, p.getP_share_count());
			pstmt.setString(6, p.getPhone());
			pstmt.setString(7, p.getP_status());
			pstmt.setInt(8, p.getP_price());
			pstmt.setString(9, p.getC_code());
			pstmt.setString(10, p.getP_simplecontent());
			pstmt.setString(11, p.getP_deadline());
			pstmt.setString(12, p.getOption());
			pstmt.setString(13, p.getC_code());
			pstmt.setString(14, p.getSavePath());
			pstmt.setString(15, p.getOriginFiles());
			pstmt.setString(16, p.getSaveFiles());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}

	public ArrayList<String> selectCategory(Connection con, String cate1, String cate2, String cate3, String cate4) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> cateList = null;

		try {
			if (cate3 == null) {
				String query = prop.getProperty("selectCateList");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);

				rset = pstmt.executeQuery();
				cateList = new ArrayList<String>();
				cateList.add(cate1);
				cateList.add(cate2);
				while (rset.next()) {
					cateList.add(rset.getString(1));
				}
			} else {

				String query = prop.getProperty("selectCateList1");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setString(3, cate3);

				rset = pstmt.executeQuery();

				cateList = new ArrayList<String>();
				cateList.add(cate1);
				cateList.add(cate2);
				cateList.add(cate3);
				while (rset.next()) {
					cateList.add(rset.getString(1));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return cateList;
	}

	public ArrayList<product> selectPro(Connection con, String cate1, String cate2, String cate3, String cate4) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;

		try {
			if (cate3 == null && cate4 == null) {
				String query = prop.getProperty("selectProList");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setInt(3, 0);
				pstmt.setInt(4, 9);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));

					proList.add(p);

				}
			} else if (cate4 == null) {
				String query = prop.getProperty("selectProList2");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setString(3, cate3);
				pstmt.setInt(4, 0);
				pstmt.setInt(5, 9);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));
					proList.add(p);
				}
			} else {
				String query = prop.getProperty("selectProList3");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setString(3, cate3);
				pstmt.setString(4, cate4);
				pstmt.setInt(5, 0);
				pstmt.setInt(6, 9);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));
					proList.add(p);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return proList;
	}


	//에이작스 패이징

	public ArrayList<product> selectPro(Connection con, int minPage, int maxPage, String cate1, String cate2,
			String cate3, String cate4) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;

		try {
			if (cate3 == null && cate4 == null) {
				String query = prop.getProperty("selectProList");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setInt(3, minPage);
				pstmt.setInt(4, maxPage);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));

					proList.add(p);

				}
			} else if (cate4 == null || cate4.equals("null")) {

				String query = prop.getProperty("selectProList2");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setString(3, cate3);
				pstmt.setInt(4, minPage);
				pstmt.setInt(5, maxPage);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));
					proList.add(p);
				}
			} else {

				String query = prop.getProperty("selectProList3");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cate1);
				pstmt.setString(2, cate2);
				pstmt.setString(3, cate3);
				pstmt.setString(4, cate4);
				pstmt.setInt(5, minPage);
				pstmt.setInt(6, maxPage);

				rset = pstmt.executeQuery();
				proList = new ArrayList<product>();

				while (rset.next()) {
					product p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_type(rset.getString("p_type"));
					p.setCate_code(rset.getInt("cate_code"));
					p.setP_name(rset.getString("p_name"));
					p.setP_content(rset.getString("p_content"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setPhone(rset.getString("phone"));
					p.setP_status(rset.getString("p_status"));
					p.setP_price(rset.getInt("p_price"));
					p.setC_code(rset.getString("c_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_simplecontent(rset.getString("p_simplecontent"));
					p.setP_deadline(rset.getString("p_deadLine"));
					p.setOriginFiles(rset.getString("OR_FILE_NAME"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
					p.setPeople(rset.getInt("people"));
					proList.add(p);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return proList;
	}



	public ArrayList searchProduct(Connection con, int p_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList detail = null;

		ProductDetail p= null;
		Reply reply = null;



		String query = prop.getProperty("searchProduct2");
		String query2 = prop.getProperty("searchPIMG");
		String query3 = prop.getProperty("searchPcount");
		String query4 = prop.getProperty("searchReply");
		detail = new ArrayList();
		try {

			//부가정보

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, p_code);
			p= new ProductDetail();
			rset = pstmt.executeQuery();
			if(rset.next()) {

				p.setP_code(rset.getString("p_code"));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString("c_code"));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
				p.setP_deadline(rset.getString("p_deadLine"));
				p.setC_image(rset.getString("SEC_FILE_NAME"));
				p.setOption(rset.getString("OPTION_DETAIL"));
				p.setC_name(rset.getString("c_name"));
				p.setP_time(rset.getString("C_PHONE"));


			}
			System.out.println("ppp : "+p);

			//상품사진

			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, p_code+"");

			rset = pstmt.executeQuery();
			if(rset.next()) {
				p.setP_image(rset.getString("SEC_FILE_NAME"));
			}


			//댓글

			pstmt = con.prepareStatement(query3);
			pstmt.setInt(1, p_code);

			rset = pstmt.executeQuery();

			ArrayList<Reply> replyList = null;
			if(rset.next()) {
				p.setTotal_sell(rset.getInt(1));
				p.setAvg_star(rset.getFloat(2));
			}

			pstmt = con.prepareStatement(query4);
			pstmt.setInt(1, p_code);
			replyList = new ArrayList();
			rset = pstmt.executeQuery();

			while(rset.next()) {
				reply = new Reply();
				reply.setC_code(rset.getString("c_code"));
				reply.setReply_content(rset.getString("reply_content"));
				reply.setReply_time(rset.getString("reply_time"));
				reply.setReply_from(rset.getInt("reply_from"));
				reply.setReply_type(rset.getInt("reply_type"));
				reply.setStar_point(rset.getInt("star_point"));
				replyList.add(reply);
			}


			detail.add(p);
			detail.add(replyList);



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {

			close(pstmt);
			close(rset);
		}
		System.out.println("detail bobo : "+ detail.size());

		return detail;
	}

	public int addReply(Connection con, Reply r) {
		PreparedStatement pstmt =null;
		int result = 0;

		String query= prop.getProperty("addReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getC_code());
			pstmt.setString(2, r.getReply_content());
			pstmt.setInt(3, r.getReply_from());
			pstmt.setInt(4, r.getStar_point());

			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {

			close(pstmt);

		}



		return result;
	}

	public ArrayList<Reply> selectReply(Connection con,Reply r) {
		ArrayList<Reply> replyList = null;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Reply reply=null;


		String query= prop.getProperty("selectReply");

		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1,r.getReply_from());
			rset= pstmt.executeQuery();

			replyList = new ArrayList<Reply>();

			while(rset.next()) {
				reply = new Reply();

				reply.setC_code(rset.getString("C_CODE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setReply_from(rset.getInt("REPLY_FROM"));
				reply.setReply_time(rset.getString("REPLY_TIME"));
				reply.setStar_point(rset.getInt("star_point"));
				reply.setReply_type(rset.getInt("reply_type"));

				replyList.add(reply);

			}

			String query1= prop.getProperty("selectStar");
			pstmt = con.prepareStatement(query1);

			pstmt.setInt(1, r.getReply_from());
			rset =  pstmt.executeQuery();

			if(rset.next()) {
				replyList.get(0).setAVGstar(rset.getFloat("star_point"));;
			}





		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return replyList;
	}

	public int getListCount(Connection con,int p_code) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_code);

			rset = pstmt.executeQuery();

			if(rset.next()){
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<Reply> selectList(Connection con, int currentPage, int limit, int p_code) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		ArrayList<Reply> list = null;

		String query = prop.getProperty("selectList");


		try {
			//페이징 처리 전
			/*stmt = con.createStatement();
			rset = stmt.executeQuery(query);*/

			//페이진 처리 후
			pstmt = con.prepareStatement(query);

			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage -1 )*limit;
			int endRow = startRow + limit +1;
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


			rset = pstmt.executeQuery();
			list= new ArrayList<Reply>();

			while(rset.next()){
				Reply reply= new Reply();

				reply.setC_code(rset.getString("C_CODE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setReply_from(rset.getInt("REPLY_FROM"));
				reply.setReply_time(rset.getString("REPLY_TIME"));
				reply.setStar_point(rset.getInt("star_point"));
				reply.setReply_type(rset.getInt("reply_type"));
				reply.setCurrentPage(currentPage);

				list.add(reply);



			}




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}


		return list;
	}

	public int updateStarPoint(Connection con, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateStarPoint");

		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, r.getReply_from());
			pstmt.setInt(2, r.getReply_from());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);

		}



		return result;
	}
	/////////////////////////////////////////////////////








	public int insertPay(Connection con, Pay pay) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertPay");
		// 결제코드
		System.out.println("dao 성공");
		System.out.println(pay);
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pay.getAc_code());
			pstmt.setString(2, pay.getC_code());
			pstmt.setInt(3, pay.getPay_price());
			pstmt.setString(4, pay.getHowtopay());
			pstmt.setString(5, pay.getP_name());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}





	public int insertReply(Connection con, product p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query= prop.getProperty("insertReply");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getC_code());
			pstmt.setString(2, p.getReply_content());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}




	public Pay selectfinishPay(Connection con, String ac_code) {
		Pay pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectfinishPay");

		System.out.println(con);
		System.out.println("dao 조회 성공");
		System.out.println(ac_code);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ac_code);

			System.out.println(query);
			rset = pstmt.executeQuery();


			// 여기서 못 들어감.
			while (rset.next()) {
				pay = new Pay();            
				pay.setPay_price(rset.getInt("pay_price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return pay;

	}




	public Dealrecord recordSum(Connection con, String c_code) {
		PreparedStatement pstmt = null;       
		ResultSet rset = null;
		Dealrecord dr = null;

		String query1 = prop.getProperty("totalprice");
		String query2 = prop.getProperty("sumsell0");
		String query3 = prop.getProperty("sumsell1");
		String query4 = prop.getProperty("sumsell2");
		String query5 = prop.getProperty("sumsell3");
		String query6 = prop.getProperty("sumsell4");
		String query7 = prop.getProperty("sumsell5");
		String query8 = prop.getProperty("sumbuy");
		String query9 = prop.getProperty("sumbuy1");
		String query10 = prop.getProperty("sumbuy2");
		String query11 = prop.getProperty("sumbuy3");
		String query12 = prop.getProperty("sumbuy4");
		String query13 = prop.getProperty("sumbuy5");

		String query14 = prop.getProperty("buycancel");
		String query15 = prop.getProperty("sellcancel");

		dr =new Dealrecord();
		try {
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setTotalprice(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query3);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell1(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query4);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell2(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query5);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell3(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query6);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell4(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query7);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumsell5(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query8);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query9);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy1(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query10);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy2(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query11);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy3(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query12);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy4(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query13);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSumbuy5(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query14);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setBuycancel(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query15);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr.setSellcancel(rset.getInt(1));
			}







		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}





		return dr;
	}

	public Income sumIncome(Connection con, String c_code, Date fromDate, Date toDate) {
		PreparedStatement pstmt = null;       
		ResultSet rset = null;
		Income in = null;


		String query1 = prop.getProperty("sumsell");
		String query2 = prop.getProperty("sumprice");
		String query3 = prop.getProperty("outtax");
		String query4 = prop.getProperty("mycash");
		String query5 = prop.getProperty("outcash");
		String query6 = prop.getProperty("sumincome");
		String query7 = prop.getProperty("requestout");
		in = new Income();
		try {
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, c_code);
			pstmt.setDate(2, fromDate);
			pstmt.setDate(3, toDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setSumsell(rset.getInt(1));
			}


			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, c_code);
			pstmt.setDate(2, fromDate);
			pstmt.setDate(3, toDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setSumprice(rset.getInt(1));
			}
			pstmt = con.prepareStatement(query3);
			pstmt.setString(1, c_code);
			pstmt.setDate(2, fromDate);
			pstmt.setDate(3, toDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setOuttax(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query4);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setMycash(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query5);
			pstmt.setString(1, c_code);
			pstmt.setDate(2, fromDate);
			pstmt.setDate(3, toDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setOutcash(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query6);
			pstmt.setString(1, c_code);
			pstmt.setDate(2, fromDate);
			pstmt.setDate(3, toDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setSumincome(rset.getInt(1));
			}

			pstmt = con.prepareStatement(query7);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				in.setRequestout(rset.getInt(1));
			}









		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}





		return in;
	}



	public int requestIncome(Connection con, String c_code, int getmoney) {
		PreparedStatement pstmt = null;       
		int result = 0;

		String query = prop.getProperty("requestIncome");


		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, getmoney);
			pstmt.setInt(3, getmoney);
			pstmt.setInt(4, getmoney);

			result = pstmt.executeUpdate();



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}





		return result;
	}

	public ArrayList<IncomeStory> selectIncomeStory(Connection con, String c_code,int currentPage,int limit) {
		PreparedStatement pstmt = null;       
		ResultSet rset = null;
		ArrayList<IncomeStory> incomeList = null;
		IncomeStory instory = null;

		int startRow = (currentPage -1 )*limit;
		int endRow = startRow + limit +1;

		String query = prop.getProperty("selectIncomeStory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			incomeList =new ArrayList<IncomeStory>();
			rset =pstmt.executeQuery();

			while(rset.next()) {
				instory = new IncomeStory();
				instory.setCurrentPage(currentPage);
				instory.setRequestDate(rset.getString("IN_DATE"));
				instory.setRequestOk(rset.getString("OUT_DATE"));
				instory.setRequestPrice(rset.getInt("OUTCOME"));
				instory.setRequestStatus(rset.getInt("OUT_STATUS"));

				incomeList.add(instory);
			}




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return incomeList;
	}

	public int getIncomeListCount(Connection con, String c_code) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("IncomeListCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();

			if(rset.next()){
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public int updateCash(Connection con, String c_code, int getmoney) {
		PreparedStatement pstmt = null;       
		int result = 0;
		String query  = prop.getProperty("updateCash");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, getmoney);
			pstmt.setString(3, c_code);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);}





		return result;
	}

	public ArrayList<product> selectMyProduct(Connection con,int currentPage,int limit ,String c_code,String status) {
		PreparedStatement pstmt = null;  
		ResultSet  rset = null;
		product p = null;
		ArrayList<product>  myList = null;



		int startRow = (currentPage -1 )*limit;
		int endRow = startRow + limit +1;



		String query = prop.getProperty("selectMyProduct1");
		String query2 = prop.getProperty("selectMyProduct2");	
		String query3= prop.getProperty("selectMyProduct3");
		try {

			if(status.equals("0")) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, c_code);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);

				}
			}else if(status.equals("3")) {
				System.out.println("정상실행");
				pstmt = con.prepareStatement(query3);
				pstmt.setString(1, c_code);
				pstmt.setString(2, status);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);

				System.out.println(query3);
				System.out.println(c_code);
				System.out.println(status);
				System.out.println(startRow);
				System.out.println(c_code);


				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();

					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setP_share_count(rset.getInt("RECORD_STATUS"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);
				}

			}else {

				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, c_code);
				pstmt.setString(2, status);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);

				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();

					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setP_share_count(rset.getInt("RECORD_STATUS"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);
				}
			}




			System.out.println("dao사이즈 :"+myList.size());



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return myList;
	}

	public int getMyProductListCount(Connection con, String c_code,String status) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query1 = prop.getProperty("getMyProductListCount1");
		String query2 = prop.getProperty("getMyProductListCount2");
		String query3 = prop.getProperty("getMyProductListCount3");

		try {

			if(status.equals("0")) {
				pstmt = con.prepareStatement(query1);
				pstmt.setString(1, c_code);

				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);
				}
			}else if(status.equals("3")) {

				pstmt = con.prepareStatement(query3);
				pstmt.setString(1, c_code);
				pstmt.setString(2, status);

				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);

				}


			}


			else {
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, c_code);
				pstmt.setString(2, status);

				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public int deleteSellProduct(Connection con, int p_code) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteSellProduct");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, p_code);
			result = pstmt.executeUpdate();



		} catch (SQLException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		}




		return result;
	}

	public int getMyProductListCount(Connection con, String c_code, String keyword,String status) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query3= prop.getProperty("getMyProductKeywordListCount3");
		String query2 = prop.getProperty("getMyProductKeywordListCount2");
		String query1= prop.getProperty("getMyProductKeywordListCount1");

		try {

			if(status.equals("0")) {
				pstmt = con.prepareStatement(query1);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);



				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);
				}
			}else if(status.equals("3")) {

				pstmt = con.prepareStatement(query3);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);
				pstmt.setString(3, status);


				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);
				}




				System.out.println("키워드 갯수셋다");

			}




			else {
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);
				pstmt.setString(3, status);



				rset = pstmt.executeQuery();

				if(rset.next()){
					listCount = rset.getInt(1);
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}

	public ArrayList<product> selectMyProduct(Connection con, int currentPage, int limit, String c_code,
			String keyword,String status) {
		PreparedStatement pstmt = null;  
		ResultSet  rset = null;
		product p = null;
		ArrayList<product>  myList = null;


		int startRow = (currentPage -1 )*limit;
		int endRow = startRow + limit +1;

		String query1 = prop.getProperty("selectMyProductKeyword1");
		String query2 = prop.getProperty("selectMyProductKeyword2");
		String query3 = prop.getProperty("selectMyProductKeyword3");

		try {

			if(status.equals("0")) {
				pstmt = con.prepareStatement(query1);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);

				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);

				}
			}else if(status.equals("3")) {

				pstmt = con.prepareStatement(query3);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);
				pstmt.setString(3, status);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);

				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setP_share_count(rset.getInt("RECORD_STATUS"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);

				}
			}else {
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, c_code);
				pstmt.setString(2, keyword);
				pstmt.setString(3, status);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);

				rset = pstmt.executeQuery();
				myList = new ArrayList<product>();
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_date(rset.getDate("p_date"));
					p.setP_name(rset.getString("p_name"));
					p.setP_status(rset.getString("p_status"));
					p.setP_share_count(rset.getInt("RECORD_STATUS"));
					p.setSaveFiles(rset.getString("sec_file_name"));
					p.setCate1(rset.getString("cate1"));
					p.setCate2(rset.getString("cate2"));
					p.setCate3(rset.getString("cate3"));
					p.setCate4(rset.getString("cate4"));
					p.setAd_code(currentPage);

					myList.add(p);


				}
			}



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return myList;
	}

	public int checkProduct(Connection con, int p_code) {
		PreparedStatement pstmt = null; 
		int result = 0;
		ResultSet rset = null;

		String query = prop.getProperty("checkProduct");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, p_code);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				result = rset.getInt(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return result;
	}

	public ProductDetail changeProduct(Connection con, int p_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		ProductDetail detail= null;
		Reply reply = null;



		String query = prop.getProperty("searchProduct");
		String query2 = prop.getProperty("searchPIMG");
		String query3 = prop.getProperty("selectCate1");
		detail = new ProductDetail();
		try {

			//부가정보

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, p_code);

			detail= new ProductDetail();
			rset = pstmt.executeQuery();
			if(rset.next()) {

				detail.setP_code(rset.getString("p_code"));
				detail.setP_type(rset.getString("p_type"));
				detail.setCate_code(rset.getInt("cate_code"));
				detail.setP_name(rset.getString("p_name"));
				detail.setP_content(rset.getString("p_content"));
				detail.setP_share_count(rset.getInt("p_share_count"));
				detail.setPhone(rset.getString("phone"));
				detail.setP_status(rset.getString("p_status"));
				detail.setP_price(rset.getInt("p_price"));
				detail.setC_code(rset.getString("c_code"));
				detail.setP_date(rset.getDate("p_date"));
				detail.setAd_code(rset.getInt("ad_code"));
				detail.setStar_point(rset.getFloat("star_point"));
				detail.setP_simplecontent(rset.getString("p_simplecontent"));
				detail.setP_deadline(rset.getString("p_deadLine"));
				detail.setC_image(rset.getString("SEC_FILE_NAME"));
				detail.setOption(rset.getString("OPTION_DETAIL"));
				detail.setC_name(rset.getString("c_name"));
				detail.setP_time(rset.getString("C_PHONE"));


			}


			//상품사진

			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, p_code+"");

			rset = pstmt.executeQuery();

			if(rset.next()) {
				detail.setP_image(rset.getString("SEC_FILE_NAME"));
			}


			pstmt = con.prepareStatement(query3);
			pstmt.setInt(1, detail.getCate_code());

			rset = pstmt.executeQuery();
			if(rset.next()) {
				detail.setCate1(rset.getString("cate1"));
				detail.setCate2(rset.getString("cate2"));
				detail.setCate3(rset.getString("cate3"));
				detail.setCate4(rset.getString("cate4"));
			}

			//카테코드

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {

			close(pstmt);
			close(rset);
		}

		return detail;
	}

	public int updateProduct(Connection con, product p) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		PreparedStatement pstmt = null;

		String query1 = prop.getProperty("updateProduct1");
		String query2 = prop.getProperty("updateProduct2");
		String query3 = prop.getProperty("updateProduct3");

		try {
			pstmt = con.prepareStatement(query1);

			pstmt.setString(1, p.getP_type());
			pstmt.setInt(2, p.getCate_code());
			pstmt.setString(3, p.getP_name());
			pstmt.setString(4, p.getP_content());
			pstmt.setInt(5, p.getP_share_count());
			pstmt.setString(6, p.getPhone());
			pstmt.setString(7, p.getP_status());
			pstmt.setInt(8, p.getP_price());
			pstmt.setString(9, p.getC_code());
			pstmt.setString(10, p.getP_simplecontent());
			pstmt.setString(11, p.getP_deadline());
			pstmt.setInt(12, p.getP_code());



			result1 = pstmt.executeUpdate();


			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, p.getOption());
			pstmt.setInt(2, p.getP_code());




			result2 =pstmt.executeUpdate();

			if(p.getOriginFiles() != null) {
				pstmt = con.prepareStatement(query3);

				pstmt.setString(1, p.getSavePath());
				pstmt.setString(2, p.getOriginFiles());
				pstmt.setString(3, p.getSaveFiles());
				pstmt.setString(4, p.getP_code()+"");

				result3 =pstmt.executeUpdate();
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result1+result2+result3;
	}

	public ArrayList<product> selectPro(Connection con, int num) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;
		product p=null;

		String query1 = prop.getProperty("mainProduct1");
		String query2 = prop.getProperty("mainProduct2");
		String query3 = prop.getProperty("mainProduct3");
		String query4 = prop.getProperty("mainProduct4");


		try {
			proList = new ArrayList<product>();
			if(num==1) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query1);
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_price(rset.getInt("p_price"));
					p.setP_name(rset.getString("p_name"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setPeople(rset.getInt("people"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));

					proList.add(p);




				}
			}

			else if(num==2) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query2);
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_price(rset.getInt("p_price"));
					p.setP_name(rset.getString("p_name"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setPeople(rset.getInt("people"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));

					proList.add(p);
				}

			}else if(num==3) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query3);
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_price(rset.getInt("p_price"));
					p.setP_name(rset.getString("p_name"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setPeople(rset.getInt("people"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));

					proList.add(p);
				}

			}else {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query4);
				while(rset.next()) {
					p = new product();
					p.setP_code(rset.getInt("p_code"));
					p.setP_price(rset.getInt("p_price"));
					p.setP_name(rset.getString("p_name"));
					p.setP_share_count(rset.getInt("p_share_count"));
					p.setStar_point(rset.getFloat("star_point"));
					p.setP_date(rset.getDate("p_date"));
					p.setAd_code(rset.getInt("ad_code"));
					p.setPeople(rset.getInt("people"));
					p.setSaveFiles(rset.getString("SEC_FILE_NAME"));

					proList.add(p);
				}
			};

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}






		return proList;

	}

	public ArrayList<product> myProductList(Connection con, String c_code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;
		product p =null;
		proList= new ArrayList<product> ();
		String query = prop.getProperty("myProductList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p= new product();
				p.setP_code(rset.getInt("p_code"));
				p.setP_name(rset.getString("p_name"));
				p.setAd_code(rset.getInt("ad_code"));

				proList.add(p);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}




		return proList;
	}

	public int updateOdong(Connection con, Advertise ad, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("updateOdong");
		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, ad.getOdongcash());
			pstmt.setString(3, c_code);

			result = pstmt.executeUpdate();



		} catch (SQLException e) {


			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}


		return result;
	}

	public int updateProductAD(Connection con, Advertise ad, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("updateProductAD");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, ad.getAd_code());
			pstmt.setInt(2, ad.getP_code());
			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}




		return result;
	}

	public int insertADRecord(Connection con, Advertise ad, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("insertADRecord");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ad.getAc_code());
			pstmt.setString(2, c_code);
			pstmt.setInt(3, ad.getTotal_price());
			pstmt.setInt(4, ad.getP_code());
			pstmt.setString(5, ad.getP_name());

			result = pstmt.executeUpdate();




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}



		return result;
	}

	public DetailCycle detailCycle(Connection con, int p_code, int status, String c_code,int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DetailCycle dc = null;

		String query = prop.getProperty("detailCycle");
		String query2 = prop.getProperty("detailCycle2");

		try {
			if(num==1) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, p_code);
				pstmt.setInt(2, status);
				pstmt.setString(3, c_code);
				rset = pstmt.executeQuery();
			}else {
				System.out.println("이거실행!");
				pstmt = con.prepareStatement(query2);
				pstmt.setInt(1, p_code);
				pstmt.setInt(2, status);
				pstmt.setString(3, c_code);
				rset = pstmt.executeQuery();

			}

			while(rset.next()) {
				dc = new DetailCycle();
				dc.setRecord_code(rset.getInt("RECORD_CODE"));
				dc.setPay_time(rset.getString("pay_time"));
				dc.setP_code(rset.getInt("p_code"));
				dc.setSave_filename(rset.getString("sec_file_name"));
				dc.setP_name(rset.getString("p_name"));
				dc.setP_price(rset.getInt("p_price"));
				dc.setP_count(rset.getInt("p_count"));
				dc.setP_option(rset.getString("p_option"));
				dc.setRecord_status(rset.getInt("record_status"));
				dc.setHowtopay(rset.getString("howtopay"));
				dc.setPay_price(rset.getInt("pay_price"));
				dc.setSc_name(rset.getString("c_name"));
				dc.setBc_name(rset.getString("구매자이름"));
				dc.setBc_code(rset.getString("구매자코드"));

			} 


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return dc;
	}

	public int complteDeal(Connection con, int record_code,int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int status = 0;
		int result = 0;



		String query2 =prop.getProperty("selectStatus");
		String query3 =prop.getProperty("updateStatus1");
		String query4 =prop.getProperty("updateStatus2");
		String query5 =prop.getProperty("updateStatus3");

		String query6 =prop.getProperty("selectStatus2");
		String query7 =prop.getProperty("updateStatus4");
		String query8 =prop.getProperty("updateStatus5");
		String query9 =prop.getProperty("updateStatus6");



		try {
			if(num==1) {
				//현제상태를찾는다

				pstmt= con.prepareStatement(query2);
				pstmt.setInt(1, record_code);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					status = rset.getInt(1);
				}

				if(status!=3) {
					//현재상태가 완료가아니면
					pstmt= con.prepareStatement(query3);
					pstmt.setInt(1, record_code);
					result   = pstmt.executeUpdate();

					result =8;

				}else {
					//현재상태가완료면


					pstmt= con.prepareStatement(query4);
					pstmt.setInt(1, record_code);
					result   = pstmt.executeUpdate();

					pstmt = con.prepareStatement(query5);
					pstmt.setInt(1, record_code);
					pstmt.setInt(2, record_code);
					pstmt.setInt(3, record_code);
					result   = pstmt.executeUpdate();

					result =6;

				}}

			else if(num==2) {
				pstmt= con.prepareStatement(query6);
				pstmt.setInt(1, record_code);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					status = rset.getInt(1);
				}

				if(status!=8) {
					//현재상태가 완료가아니면
					pstmt= con.prepareStatement(query7);
					pstmt.setInt(1, record_code);
					result   = pstmt.executeUpdate();

					result =8;

				}else {

					//현재상태가완료면
					pstmt= con.prepareStatement(query8);
					pstmt.setInt(1, record_code);
					result   = pstmt.executeUpdate();

					pstmt = con.prepareStatement(query9);
					pstmt.setInt(1, record_code);
					pstmt.setInt(2, record_code);
					pstmt.setInt(3, record_code);
					result   = pstmt.executeUpdate();

					result =6;





				}
			}




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}




	////////////////////////////////////////////////////////////////////////

	public int insertRequest(Connection con, product p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertRequest");

		// 결제코드
		System.out.println("dao 성공");
		System.out.println(p);
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getP_name());
			pstmt.setInt(2, p.getP_price());
			pstmt.setString(3, p.getP_simplecontent());
			pstmt.setString(4, p.getReq_status());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}















	public product selectOne(Connection con, int num) {
		product product = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectProduct");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				product = new product();
				product.setP_code(rset.getInt(1));
				product.setOriginFiles(rset.getString("OR_FILE_NAME"));
				product.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				product.setP_content(rset.getString("FILE_ROOT"));
				product.setC_code(rset.getString("c_id"));
				product.setOption(rset.getString("option_detail"));
				product.setCate_code(rset.getInt("cate_code"));
				product.setP_name(rset.getString("p_name"));
				product.setP_price(rset.getInt("p_price"));


			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return product;
	}

/////// 수정한 곳
  public int insertReply(Connection con, Reply r, int p_code) {
  PreparedStatement pstmt = null;
  int result = 0;
  System.out.println("종복"); 
  
  String query= prop.getProperty("insertReply2");
  
  try {
     pstmt = con.prepareStatement(query);
     pstmt.setString(1, r.getC_code());
     pstmt.setString(2, r.getReply_content());
     pstmt.setInt(3, p_code);
     result = pstmt.executeUpdate();
  
  } catch (SQLException e) {
     e.printStackTrace();
  } finally {
     close(pstmt);
  }

  return result;
}

  
  
  public ArrayList<Reply> selectReplyList(Connection con, String c_code, int p_code) {
      System.out.println("여기까지 옴");
   
  PreparedStatement pstmt= null;
  ResultSet rset = null;
  ArrayList<Reply> replyList = null;
  
  String query= prop.getProperty("selectReplyList");
      
  try {
     pstmt = con.prepareStatement(query);
     pstmt.setString(1, c_code);
     pstmt.setInt(2, p_code);
     System.out.println(c_code);
     rset = pstmt.executeQuery();
     replyList = new ArrayList<Reply>();
     
     while(rset.next()) {
        Reply r= new Reply();
        
        r.setC_code(rset.getString("c_id"));
        r.setReply_content(rset.getString("reply_content"));
        r.setReply_time(rset.getString("reply_time"));
        
        replyList.add(r);
     }
  } catch (SQLException e) {
     e.printStackTrace();
  } finally {
     close(pstmt);
     close(rset);
  }
  
  
  return replyList;
}
/////// 수정한 곳

	public ArrayList<Reply> selectReplyList(Connection con, String c_code) {
		System.out.println("여기까지 옴");

		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Reply> replyList = null;

		String query= prop.getProperty("selectReplyList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			System.out.println(c_code);
			rset = pstmt.executeQuery();
			replyList = new ArrayList<Reply>();

			while(rset.next()) {
				Reply r= new Reply();

				r.setC_code(rset.getString("c_id"));
				r.setReply_content(rset.getString("reply_content"));
				r.setReply_time(rset.getString("reply_time"));

				replyList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}


		return replyList;
	}


	public Pay searchPay(Connection con, String ac_code) {
		Pay pay= null;
		System.out.println("여기까지 옴");

		PreparedStatement pstmt= null;
		ResultSet rset = null;


		String query= prop.getProperty("searchPay");
		System.out.println(query);
		System.out.println(ac_code);
		try {
			pstmt = con.prepareStatement(query);   
			pstmt.setString(1, ac_code);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				pay= new Pay();
				pay.setP_name(rset.getString("p_name"));
				pay.setP_count(rset.getInt("p_count"));
				pay.setPay_price(rset.getInt("pay_price"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return pay;
	}



	public Pay searchPayCount(Connection con, String c_code) {
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		Pay searchPayCount =null;

		String query1 = prop.getProperty("searchPayCount1"); // 무통장
		String query2 = prop.getProperty("searchPayCount2"); // 카드
		String query3 = prop.getProperty("searchPayCount3"); // 공유 완료
		String query4 = prop.getProperty("searchPayCount4"); // 거래완료(판매, 구매자 둘다 완료시)
		String query5 = prop.getProperty("searchPayCount5"); // 수정요청
		String query6 = prop.getProperty("searchPayCount6"); // 구매취소 
		String query7 = prop.getProperty("searchPayCount7"); // 판매취소 
		searchPayCount = new Pay();

		try {
			//1

			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, c_code);
			rset = pstmt.executeQuery();

			if(rset.next()){
				searchPayCount.setPay_price(rset.getInt(1));
			}

			//2

			pstmt = con.prepareStatement(query2);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();

			if(rset.next()){
				searchPayCount.setPay_code(rset.getInt(1));        
			}

			//3

			pstmt = con.prepareStatement(query3);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();


			if(rset.next()){
				searchPayCount.setFrom_code(rset.getInt(1));        
			}

			//4


			pstmt = con.prepareStatement(query4);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();
			if(rset.next()){
				searchPayCount.setP_code(rset.getInt(1));        
			}


			//5

			pstmt = con.prepareStatement(query5);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();
			if(rset.next()){
				searchPayCount.setP_count(rset.getInt(1));        
			}

			//6 
			pstmt = con.prepareStatement(query6);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();
			if(rset.next()){
				searchPayCount.setP_count2(rset.getInt(1));        
			}

			//7 
			pstmt = con.prepareStatement(query7);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();
			if(rset.next()){
				searchPayCount.setP_count3(rset.getInt(1));        
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return searchPayCount;
	}




	public ArrayList<Pay> searchMyPayCount(Connection con, String c_code) {
		ArrayList<Pay> list2 = new ArrayList<Pay>();
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		Pay searchPayCount =null;

		String query = prop.getProperty("searchMyPayCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);

			rset = pstmt.executeQuery();

			if(rset.next()){
				searchPayCount = new Pay();
				searchPayCount.setP_count(rset.getInt(1));
				list2.add(searchPayCount);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return list2;
	}

	public Pay selectPayList(Connection con, String ac_code) {

		Pay pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectPayList");

		System.out.println(con);
		System.out.println("selctPaydao 조회 성공");
		System.out.println(ac_code);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ac_code);
			System.out.println(query);
			rset = pstmt.executeQuery();


			// 여기서 못 들어감.
			while (rset.next()) {
				pay = new Pay();          
				pay.setP_name(rset.getString("p_name"));
				//  pay.setHowtopay(rset.getString("option_detail"));
				pay.setPay_price(rset.getInt("pay_price"));
				pay.setP_count(rset.getInt("p_count"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return pay;
	}

	public ArrayList<Pay> searchBuyList(Connection con, String c_code) {
		ArrayList<Pay> list = null;
		Pay pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchBuyList");

		System.out.println(con);
		System.out.println("selctPaydao 조회 성공");
		System.out.println(c_code);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			System.out.println(query);
			rset = pstmt.executeQuery();


			// 여기서 못 들어감.
			while (rset.next()) {

				pay = new Pay();          
				pay.setP_name(rset.getString("p_name"));
				//  pay.setHowtopay(rset.getString("option_detail"));
				pay.setPay_price(rset.getInt("pay_price"));
				pay.setP_count(rset.getInt("p_count"));
				list.add(pay);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int insertPay(Connection con, Pay pay, String ac_code) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertPay");
		// 결제코드
		System.out.println("dao 성공");
		System.out.println(pay);
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ac_code);
			pstmt.setString(2, pay.getC_code());
			pstmt.setInt(3, pay.getTotal_price());
			pstmt.setString(4, pay.getHowtopay());

			pstmt.setInt(5, pay.getP_code());
			pstmt.setString(6, pay.getP_name());
			pstmt.setInt(7, pay.getP_count());
			pstmt.setString(8, pay.getP_option());

			pstmt.setInt(9, pay.getP_code());
			pstmt.setString(10, pay.getC_code());
			pstmt.setInt(11, pay.getTotal_price());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}

	public int insertBank(Connection con, Pay p) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBank");

		System.out.println("무통장dao 성공");
		System.out.println(p);
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, p.getAc_code());
			pstmt.setString(2, p.getC_code());
			pstmt.setInt(3, p.getPay_price());
			pstmt.setString(4, p.getHowtopay());

			//2 from code pay time 
			pstmt.setInt(5, p.getP_code());
			pstmt.setString(6, p.getP_name());
			pstmt.setInt(7, p.getP_count());
			pstmt.setString(8, p.getP_option());


			pstmt.setInt(9, p.getP_code());
			pstmt.setString(10, p.getC_code());
			pstmt.setInt(11, p.getPay_price());


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}

	public ArrayList<Pay> buyList(Connection con, String c_code) {
		ArrayList<Pay> list =new ArrayList<Pay>();

		Pay pay= null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("MybuyList");

		System.out.println(con);
		System.out.println("mybuyList 조회 성공");
		System.out.println(c_code);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			System.out.println(query);
			rset = pstmt.executeQuery();


			// 여기서 못 들어감.
			while (rset.next()) {

				pay = new Pay();          

				//             pay.setP_content(rset.getString("FILE_ROOT"));      
				//             pay.setOriginFiles(rset.getString("OR_FILE_NAME"));
				//             pay.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				//             pay.setC_code(rset.getString("c_id"));
				//             pay.setP_code(rset.getInt("p_code"));
				//             pay.setStar_point(rset.getInt("star_point"));
				//             pay.setP_name(rset.getString("p_name"));

				list.add(pay);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public ArrayList<product> searchProductEngine(Connection con, String keyword, String c_code, int currentPage, int limit) {
		ArrayList<product> list = new ArrayList<product>();
		PreparedStatement pstmt = null;
		ResultSet rset= null;

		String query = prop.getProperty("searchProductEngine");

		System.out.println(query);
		try {
			int startRow = (currentPage -1)*limit+1;
			int endRow = startRow + limit -1;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, keyword);

			System.out.println(query);
			System.out.println(startRow);
			System.out.println(endRow);

			rset = pstmt.executeQuery();

			System.out.println();

			while(rset.next()){
				product p= new product();

				p= new product();


				p.setP_share_count(rset.getInt("record_status"));
				p.setCate1(rset.getString("cate1"));
				p.setCate2(rset.getString("cate2"));
				p.setCate3(rset.getString("cate3"));
				p.setCate4(rset.getString("cate4"));
				p.setAd_code(rset.getInt("RECORD_CODE"));
				p.setP_content(rset.getString("FILE_ROOT"));      
				p.setOriginFiles(rset.getString("OR_FILE_NAME"));
				p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				p.setP_code(rset.getInt("p_code"));
				p.setP_name(rset.getString("p_name"));
				p.setC_code(rset.getString("c_id"));
				p.setP_price(rset.getInt("p_price"));

				list.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		System.out.println("검색완료?");
		System.out.println(list);
		return list;
	}

	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("BuylistCount");
		try {
			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			if(rset.next()){
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}


	public ArrayList<product> buyList(Connection con, String c_code, int currentPage, int limit) {
		System.out.println("buyListdao 페이징 이상없음");
		//페이징 처리 후
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		ArrayList<product> list = null;

		String query = prop.getProperty("SelectbuyList");


		try {
			//페이징 처리 전

			//페이진 처리 후
			pstmt = con.prepareStatement(query);

			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage -1)*limit+1;
			int endRow = startRow + limit -1;

			pstmt.setString(1, c_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			System.out.println(query);
			System.out.println(startRow);
			System.out.println(endRow);
			rset = pstmt.executeQuery();
			list= new ArrayList<product>();

			while(rset.next()){
				product p= new product();

				p.setP_share_count(rset.getInt("record_status"));
				p.setCate1(rset.getString("cate1"));
				p.setCate2(rset.getString("cate2"));
				p.setCate3(rset.getString("cate3"));
				p.setCate4(rset.getString("cate4"));
				p.setAd_code(rset.getInt("RECORD_CODE"));
				p.setP_content(rset.getString("FILE_ROOT"));      
				p.setOriginFiles(rset.getString("OR_FILE_NAME"));
				p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				p.setP_code(rset.getInt("p_code"));
				p.setP_name(rset.getString("p_name"));
				p.setC_code(rset.getString("c_id"));
				p.setP_price(rset.getInt("p_price"));

				list.add(p);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		// 여기가 빔/
		System.out.println(list);

		System.out.println("dao 페이지 조회 성공");
		return list;
	}

	public int updateRequest(Connection con, String record_code) {
		int result = 0;
		PreparedStatement pstmt = null;


		String query=prop.getProperty("updateRequestBuyList");

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, record_code);
			result=pstmt.executeUpdate();

			System.out.println(query);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int finishBuying(Connection con, String record_code) {
		int result = 0;
		PreparedStatement pstmt = null;


		String query=prop.getProperty("finishBuying");

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, record_code);
			result=pstmt.executeUpdate();

			System.out.println(query);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public product searchCategory(Connection con, int p_code) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		product p = null;

		String query = prop.getProperty("SearchCategory");


		try {
			//페이징 처리 전

			//페이진 처리 후
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p_code);

			rset = pstmt.executeQuery();
			//list= new ArrayList<product>();

			while(rset.next()){

				p= new product();
				p.setCate1(rset.getString("cate1"));
				p.setCate2(rset.getString("cate2"));
				p.setCate3(rset.getString("cate3"));
				p.setCate4(rset.getString("cate4"));



			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		return p; 

	}

	public ArrayList<product> buyListDetail(Connection con, String c_code, int record_status) {


		//페이징 처리 후
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		ArrayList<product> list = null;

		String query = prop.getProperty("SelectbuyListDetail");
		String query2 = prop.getProperty("SelectbuyListDetail2");
		try {
			if(record_status==3) {
				pstmt = con.prepareStatement(query2);
			}
			else {
				pstmt = con.prepareStatement(query);}

			pstmt.setString(1, c_code);
			pstmt.setInt(2, record_status);
			System.out.println(query);

			rset = pstmt.executeQuery();
			list= new ArrayList<product>();

			while(rset.next()){
				product p= new product();

				p.setP_share_count(rset.getInt("record_status"));
				p.setCate1(rset.getString("cate1"));
				p.setCate2(rset.getString("cate2"));
				p.setCate3(rset.getString("cate3"));
				p.setCate4(rset.getString("cate4"));
				p.setAd_code(rset.getInt("RECORD_CODE"));
				p.setP_content(rset.getString("FILE_ROOT"));      
				p.setOriginFiles(rset.getString("OR_FILE_NAME"));
				p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				p.setP_code(rset.getInt("p_code"));
				p.setP_name(rset.getString("p_name"));
				p.setC_code(rset.getString("c_id"));
				p.setP_price(rset.getInt("p_price"));

				list.add(p);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}

		System.out.println(list);

		System.out.println("dao 페이지 조회 성공");
		return list;
	}


	///수정
	public int requestDeal(Connection con, int dealcode, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("requestDeal");

		try {


			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dealcode);
			pstmt.setString(2, c_code);

			result = pstmt.executeUpdate();




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int cancelDeal(Connection con, int dealcode, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("cancelDeal");

		try {
			System.out.println("cancelDeal2");

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, dealcode);


			result = pstmt.executeUpdate();




		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int cancelDeal2(Connection con, int dealcode, String c_code) {
		PreparedStatement pstmt = null;
		int result =0;

		String query = prop.getProperty("cancelDeal2");

		try {
			System.out.println("cancelDeal2");

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, dealcode);


			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<product> searchProduct(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;
		product p =null;
		


		String query = prop.getProperty("searchProduct");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, 0);
			pstmt.setInt(3, 9);


			rset = pstmt.executeQuery();
			proList = new ArrayList<product>();

			while (rset.next()) {
				 p = new product();
				p.setP_code(rset.getInt("p_code"));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString("c_code"));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
				p.setP_deadline(rset.getString("p_deadLine"));
				p.setOriginFiles(rset.getString("OR_FILE_NAME"));
				p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				p.setPeople(rset.getInt("people"));

				proList.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return proList;
	}

	public ArrayList<product> selectPro(Connection con, int minPage, int maxPage, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<product> proList = null;
		product p =null;
		


		String query = prop.getProperty("searchProduct");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, minPage);
			pstmt.setInt(3, maxPage);


			rset = pstmt.executeQuery();
			proList = new ArrayList<product>();

			while (rset.next()) {
				 p = new product();
				p.setP_code(rset.getInt("p_code"));
				p.setP_type(rset.getString("p_type"));
				p.setCate_code(rset.getInt("cate_code"));
				p.setP_name(rset.getString("p_name"));
				p.setP_content(rset.getString("p_content"));
				p.setP_share_count(rset.getInt("p_share_count"));
				p.setPhone(rset.getString("phone"));
				p.setP_status(rset.getString("p_status"));
				p.setP_price(rset.getInt("p_price"));
				p.setC_code(rset.getString("c_code"));
				p.setP_date(rset.getDate("p_date"));
				p.setAd_code(rset.getInt("ad_code"));
				p.setStar_point(rset.getFloat("star_point"));
				p.setP_simplecontent(rset.getString("p_simplecontent"));
				p.setP_deadline(rset.getString("p_deadLine"));
				p.setOriginFiles(rset.getString("OR_FILE_NAME"));
				p.setSaveFiles(rset.getString("SEC_FILE_NAME"));
				p.setPeople(rset.getInt("people"));

				proList.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return proList;
	}
}













