package email;

import java.util.ArrayList;

public class DaoTest {

  public static void main(String[] args) {
    // 1. 전체 목록 조회 
    EmaillistDao dao = new EmaillistDao();
//    ArrayList<EmaillistVo> list = dao.getList();
//    
//    for(EmaillistVo vo : list) {
//      System.out.println(vo);
//    }
    
    // 2. 신규 정보 저장 
    EmaillistVo vo = new EmaillistVo("Test", "Dao","testdao@test.com");
//    if(dao.insert(vo)) {
//      System.out.println("데이터 입력 성공");
//    }else{
//      System.out.println("데이터 입력 실패");
//    }
    
    // 3. 기존 정보 삭제
//    String emailNo;
//	if(dao.delete(emailNo)) {
//        System.out.println("데이터 삭제 성공");
//      }else{
//        System.out.println("데이터 삭제 실패");
//      }
    
    
    
  }
}
