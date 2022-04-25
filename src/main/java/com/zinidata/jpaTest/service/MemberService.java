package com.zinidata.jpaTest.service;


import com.zinidata.jpaTest.repository.MemberRepository;
import com.zinidata.jpaTest.vo.MemberVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Transactional(readOnly = false)
    public List<MemberVo> findAll() {
        List<MemberVo> members = new ArrayList<>();
        memberRepository.findAll().forEach(e -> members.add(e));
        return members;
    }

    @Transactional(readOnly = false)
    public List<MemberVo> findByUserId(String userId) {
        List<MemberVo> member = memberRepository.findByUserId(userId);
        return member;
    }

    @Transactional(readOnly = false)
    public List<MemberVo> findByUserName(String userId) {
        List<MemberVo> member = memberRepository.findByUserName(userId);
        return member;
    }

//    public void deleteByUserId(String userId) {
//        memberRepository.deleteByUserId(userId);
//    }
//
//    public MemberVo save(MemberVo member) {
//        memberRepository.save(member);
//        return member;
//    }

//    public void updateByUserId(String userId, MemberVo member) {
//        Optional<MemberVo> e = memberRepository.findById(userId);
//
//        if (e.isPresent()) {
//            e.get().setUserId(member.getUserId());
//            e.get().setUserName(member.getUserName());
//            memberRepository.save(member);
//        }
//    }
}
