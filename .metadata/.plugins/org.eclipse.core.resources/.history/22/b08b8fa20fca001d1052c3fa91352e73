package BookRental;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Book { 
    private String bookName;   //도서명
    private String ISBN;   // 책 번호 UUID로 생성해서 String으로

    private int numOfBooks;   //책 개수
    private List<Date> date_list = new ArrayList<>();   //예약여부 (?)

    // 책 선언
    public Book(String bookName) {
        this.bookName = bookName;
        this.ISBN = UUID.randomUUID().toString();
    }

    public Book(String bookName, int numOfBooks) {
        this.bookName = bookName;
        this.numOfBooks = numOfBooks;
        this.ISBN = UUID.randomUUID().toString();
    }

    //getter setter
    public String getBookName() {
        return bookName;
    }

    public int getNumOfBooks() {
        return numOfBooks;
    }



    public void setNumOfBooks(int numOfBooks) {
        this.numOfBooks = numOfBooks;
    }

    public String getISBN() {
        return ISBN;
    }

    @Override
    public String toString() {
        return
                "\n책 정보 : " + bookName +
                        "\n ISBN : " + ISBN + " 번";
    }

    // 대출 기능 추가
    public boolean borrowBook() {
        if (numOfBooks > 0) {    // 대출 가능한 상태인 경우
            numOfBooks--;
            return true;
        } else {                 // 대출 불가능한 상태인 경우
            return false;
        }
    }

    // 반납 기능 추가
    public void returnBook() {
        numOfBooks++;
    }

    public List<Date> getDate_list() {
        return date_list;
    }

    public boolean addDate_list(String date) {

        Date trans_date = transformDate(date);
        for (Date day : date_list) {
            if (day == trans_date) {  //중복된 대출일이 있다면
                return false;
            }
            this.date_list.add(trans_date);
            return true;        //중복된 대출일 없으면 삽입
        }
        this.date_list.add(trans_date);
        return true;
    }

    public void delDate_List(String date) {    //대출일 받음
        Date trans_date = transformDate(date);
        for (Date day : date_list) {
            if (day == trans_date) {  //중복된 대출일이 있다면
                date_list.remove(day);
                return;
            }
        }
    }

    public Date transformDate(String date) {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-mm-dd");

        // Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

        java.util.Date tempDate = null;

        try {
            // 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
            tempDate = beforeFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
        String transDate = afterFormat.format(tempDate);

        // 반환된 String 값을 Date로 변경한다.
        Date d = Date.valueOf(transDate);

        return d;
    }
}
