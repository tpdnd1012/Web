package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDto;

public class MemberDao {

	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public MemberDao() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static MemberDao instance = new MemberDao();

	// DB 객체 반환 해주는 메소드
	public static MemberDao getinstance() {

		return instance;

	}

	// 로그인 메소드
	public int login(String id, String password) {

		String sql = "select * from member where id=? and password=?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return 1; // 성공

			} else {

				return 2; // 로그인 실패

			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return -1; // 실패
	}

	// 회원가입 메소드
	public int signup(MemberDto dto) {

		String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getMail());
			pstmt.setString(7, dto.getPhone());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getRegist_day());

			pstmt.executeUpdate();

			return 1;

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1;
	}

	// 로그인된 회원의 정보 호출 메소드
	public MemberDto getmember(String logid) {

		String sql = "select * from member where id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, logid);

			rs = pstmt.executeQuery(); // 쿼리 => SQL 후 결과

			if (rs.next()) { // 다음 레코드 [ 한줄 ] // rs : null 부터 시작 그 다음 결과1 ~~~

				MemberDto memberDto = new MemberDto();

				memberDto.setId(rs.getString(1));
				memberDto.setPassword(rs.getString(2));
				memberDto.setName(rs.getString(3));
				memberDto.setGender(rs.getString(4));
				memberDto.setBirth(rs.getString(5));
				memberDto.setMail(rs.getString(6));
				memberDto.setPhone(rs.getString(7));
				memberDto.setAddress(rs.getString(8));
				memberDto.setRegist_day(rs.getString(9));

				return memberDto;

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	// 회원탈퇴 메소드
	public int delete(String logid) {

		String sql = "delete from member where id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, logid);

			pstmt.executeUpdate(); // 쿼리 => SQL 후 결과

			return 1;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 회원수정 메소드
	public int update(String logid, MemberDto dto) {

		String sql = "update member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? where id=";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getMail());
			pstmt.setString(7, dto.getAddress());
			pstmt.setString(8, logid);

			pstmt.executeUpdate(); // 쿼리 => SQL 후 결과

			return 1;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

}
