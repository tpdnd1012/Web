package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardDto;

public class BoardDao {

	// DAO : DB 접근 객체

	private Connection conn; // DB 연결 인터페이스
	private ResultSet rs; // SQL 실행 후 결과 연결 인터페이스

	public BoardDao() {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 연결

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC", "root", "1234");

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
	}

	// 다른 클래스에서 DB 사용하기 위한 객체 선언
	private static BoardDao instance = new BoardDao();

	// DB 객체 반환 해주는 메소드
	public static BoardDao getinstance() {

		return instance;

	}

	// 게시물 작성 메소드
	public int boardSave(BoardDto dto) {

		String sql = "insert into board(title, contents, author) " + " values(?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContents());
			pstmt.setString(3, dto.getAuthor());

			pstmt.executeUpdate();

			return 1; // 성공

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1; // 실패
	}

	// 모든 게시물 반환
	public ArrayList<BoardDto> boardlist() {

		ArrayList<BoardDto> list = null;

		String sql = "select * from board";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			list = new ArrayList();

			while (rs.next()) {

				BoardDto dto = new BoardDto();

				dto.setNum(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContents(rs.getString(3));
				dto.setAuthor(rs.getString(4));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return null;
	}

	// 게시물 삭제
	public int delete(int num) {

		String sql = "delete from board where num = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

			return 1;

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return -1;
	}

	// 모든 게시물 반환
	public BoardDto board(int num) {

		String sql = "select * from board where num=?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				BoardDto dto = new BoardDto();

				dto.setNum(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContents(rs.getString(3));
				dto.setAuthor(rs.getString(4));

				return dto;

			}

		} catch (Exception e) {
			e.getMessage();
			e.getStackTrace();
		}
		return null;
	}
}
