package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.CDto;
import DTO.SDto;
import DTO.TDto;

public class Dao {

	private DataSource dataSource = null;

	public Dao() {
		try {

			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<TDto> list(){
		ArrayList<TDto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {
			String query= "select teacher_code, teacher_name, class_name, "
					+ "('₩' || TO_CHAR(class_price,'fm999,999,999')) 			class_price, " +
					"substr(teacher_regist_date, 1, 4)||'년'||substr(teacher_regist_date, 5, 2)||'월'||substr(teacher_regist_date, 7, 2)||'일' as teacher_regist_date " +
					"from tbl_teacher order by teacher_code";
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next()) {

				String teacher_code = rs.getString("teacher_code");
				String teacher_name = rs.getString("teacher_name");
				String class_name = rs.getString("class_name");
				String class_price = rs.getString("class_price");
				String teacher_regist_date = rs.getString("teacher_regist_date");

				TDto dto = new TDto(teacher_code,teacher_name,class_name,class_price,teacher_regist_date);

				dtos.add(dto);
				// 결과값이 0일 경우 실패, 1일 경우 성공이다

			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
		return dtos;	
	}
	
	public List<CDto> SalesList(){
		ArrayList<CDto> dtos = new ArrayList<>();

		System.out.println("SalesList() ..");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {	

			String query = "SELECT C.teacher_code, T.class_name , T.teacher_name ,"
					+ "('₩' || TO_CHAR(SUM(C.tuition),'fm999,999,999'))as tuition "
					+ "FROM TBL_CLASS C, TBL_TEACHER T "
					+ "WHERE C.teacher_code = T.teacher_code "
					+ "GROUP BY(C.teacher_code, T.class_name, T.teacher_name) "
					+ "ORDER BY C.teacher_code";


			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				String teacher_code = rs.getString("teacher_code");
				String teacher_name = rs.getString("class_name");
				String class_name = rs.getString("teacher_name");
				String tuition = rs.getString("tuition");
				
				CDto dto = new CDto(teacher_code,class_name,teacher_name,tuition);
	
				dtos.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {			

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dtos;
	}

	public void SignUp(String regist_month, String c_no, String class_area,String tuition, String teacher_code){
		System.out.println("SignUp() ..");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		System.out.println(teacher_code);
		

		try {
			String query = "insert into tbl_class "
					+ "(regist_month, c_no, class_area, tuition, teacher_code)"
					+ "values (?,?,?,?,?)";

			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, regist_month);
			preparedStatement.setString(2, c_no);
			preparedStatement.setString(3, class_area);
			preparedStatement.setString(4, tuition);
			preparedStatement.setString(5, teacher_code);

			int rn = preparedStatement.executeUpdate();
			System.out.println("업데이트 갯수 :"+rn);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {			

				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}


	public List<SDto> student_list(){
		ArrayList<SDto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {
			String query= "select substr(regist_month, 1, 4)||'년'||substr(regist_month, 5, 2)||'월' as regist_month, "
					+ "c.c_no, m.c_name, " + 
					"case c.teacher_code when '100' then '초급반' when '200' then '중급반' when '300' then '고급반' when '400' then '심화반' end as teacher_code, " + 
					"c.class_area, to_char(c.tuition, 'L999,999') as tuition, m.grade from tbl_class c, tbl_member m where c.c_no = m.c_no order by c_no";
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next()) {
				String regist_month = rs.getString("regist_month");
				int c_no = rs.getInt("c_no");
				String c_name = rs.getString("c_name");
				String teacher_code = rs.getString("teacher_code");
				String class_area = rs.getString("class_area");
				String tuition = rs.getString("tuition");
				String grade = rs.getString("grade");


				SDto dto = new SDto(regist_month, c_no, c_name, teacher_code, class_area, tuition, grade);

				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {

				if(rs != null) rs.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}	
		return dtos;
	}

}
