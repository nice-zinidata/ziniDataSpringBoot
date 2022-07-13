package com.zinidata.bizmapAdmin.mapper;

import com.zinidata.bizmapAdmin.vo.BizAdminVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BizAdminMapper {

    ArrayList<BizAdminVO> rMemberList(BizAdminVO BizAdminVO);
    ArrayList<BizAdminVO> rMemberHstList(BizAdminVO BizAdminVO);
    ArrayList<BizAdminVO> rFranMemberList(BizAdminVO BizAdminVO);
    ArrayList<BizAdminVO> rSvcList(BizAdminVO BizAdminVO);
}
