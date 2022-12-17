package com.example.hien_thi_danh_sach_khach_hang;

import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public static List<Customer> customerList;
    static {
        customerList=new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang"));
        customerList.add(new Customer("Nguyễn Thái Hà","1983-08-22","Nam Định"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội"));
    }
}
