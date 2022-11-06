use cs_quanlyfuruma;
select *from nhan_vien 
-- cau2 
where char_length(ho_ten)<15 and (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%');

-- cau3
select *from khach_hang
where (year(curdate())-year(ngay_sinh)) between 18 and 50
and(dia_chi like '%Đà Nẵng'or dia_chi like '% Quảng Trị');

-- cau4
select kh.ma_khach_hang, kh.ho_ten,count(hd.ma_hop_dong) as 'Tong don dat'
from khach_hang kh join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
where lk.ten_loai_khach='Diamond'
group by(kh.ma_khach_hang)
order by count(hd.ma_hop_dong) asc;

-- cau5

select
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (sum(dvdk.gia * hdct.so_luong) + tmp.gia_dv) tong_tien
from
    khach_hang kh
    left join loai_khach lk using (ma_loai_khach)
    left join hop_dong hd using (ma_khach_hang)
    left join dich_vu dv using (ma_dich_vu)
    left join hop_dong_chi_tiet hdct using (ma_hop_dong)
    left join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
    left join (
        select
            kh.ma_khach_hang as ma_khach_hang,
            sum(dv.chi_phi_thue) as gia_dv
        from
            khach_hang kh
            join hop_dong hd using (ma_khach_hang)
            join dich_vu dv using (ma_dich_vu)
        group by
            kh.ma_khach_hang
    ) tmp using (ma_khach_hang)
group by
    kh.ma_khach_hang;
    
-- cau6
select dv.ma_dich_vu,dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (select ma_dich_vu from hop_dong where month(ngay_lam_hop_dong) between 1 and 3 and year(ngay_lam_hop_dong)=2021); 

-- cau7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv join dich_vu dv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu 	
where dv.ma_dich_vu not in(select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)=2021) and year(ngay_lam_hop_dong)=2020
group by dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu ;

-- cau8
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

select distinct ho_ten from khach_hang;

select ho_ten from khach_hang
group by ho_ten;

-- cau9
select tmp.thang, num.so_lan_khach_dat
from(
select 1 as thang union
select 2 as thang union
select 3 as thang union
select 4 as thang union
select 5 as thang union
select 6 as thang union
select 7 as thang union
select 8 as thang union
select 9 as thang union
select 10 as thang union
select 11 as thang union
select 12 as thang ) as tmp 
left join (
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_lan_khach_dat
from hop_dong
where year(ngay_lam_hop_dong) = '2021'
group by thang ) as num using (thang);

-- cau10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as  so_luong_dich_vu_di_kem
from hop_dong hd left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
group by ma_hop_dong;

-- cau11
select dvdk.ten_dich_vu_di_kem
from loai_khach lk join khach_hang kh on lk.ma_loai_khach=kh.ma_loai_khach 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi like '%Vinh' or kh.dia_chi like'%Quảng Ngãi';

-- cau12
select ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(tien_dat_coc) as tong_tien_dat_coc, sum(so_luong) as so_luong_dich_vu_di_kem
from hop_dong join nhan_vien nv using (ma_nhan_vien) join khach_hang kh using (ma_khach_hang) join dich_vu dv using (ma_dich_vu) join hop_dong_chi_tiet using (ma_hop_dong) 
where ngay_lam_hop_dong between '2020-10-01'and '2020-12-31' and ngay_lam_hop_dong not between '2021-01-01' and '2021-6-31'
group by ma_hop_dong;
-- cau13
with count_used as (
select ma_dich_vu_di_kem, ten_dich_vu_di_kem,sum(so_luong) as tong_so_luong_dvdk
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct using(ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem
)
select ma_dich_vu_di_kem, ten_dich_vu_di_kem, tong_so_luong_dvdk
from count_used
where tong_so_luong_dvdk=(select max(tong_so_luong_dvdk)
from count_used);

-- cau14
select ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from loai_dich_vu join dich_vu using (ma_loai_dich_vu) join hop_dong using (ma_dich_vu) join hop_dong_chi_tiet hdct using(ma_hop_dong) join dich_vu_di_kem using (ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem
having so_lan_su_dung=1;

-- cau15
select ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi, count(hd.ma_nhan_vien) as tong_hop_dong_da_lap
from nhan_vien join trinh_do using (ma_trinh_do) join bo_phan using (ma_bo_phan) join hop_dong hd using (ma_nhan_vien)
group by ma_nhan_vien
having tong_hop_dong_da_lap <=3;
set sql_safe_updates =0;

-- cau16
delete from nhan_vien nv
where not exists (
select *from hop_dong 
where ma_nhan_vien = nv.ma_nhan_vien
and year(ngay_lam_hop_dong) between 2019 and 2021);

-- cau18
delete from khach_hang kh
where not exists (
select *from hop_dong 
where ma_khach_hang=kh.ma_khach_hang and year(ngay_lam_hop_dong)>=2021);

-- cau19
update dich_vu_di_kem
set gia=gia*2
where ma_dich_vu_di_kem in(
select tmp.ma_dich_vu_di_kem
from (
select ma_dich_vu_di_kem
from (
select ma_dich_vu_di_kem, sum(so_luong) t
from dich_vu join hop_dong using(ma_dich_vu) join hop_dong using (ma_hop_dong)
group by ma_dich_vu_di_kem
having t>10)
	)tmp
);

-- cau20
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang


