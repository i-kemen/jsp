package com.member;

import java.util.List;

public interface MemberDAOInterface {
    List<MemberDTO> getAllMembers();

    MemberDTO getMemberById(String id);

    void addMember(MemberDTO member);

    void updateMember(MemberDTO member);

    void deleteMember(String id);

    void approveMembership(String id);

    List<MemberDTO> getJoinRequests();

    List<MemberDTO> getWithdrawalRequests();

    List<MemberDTO> searchMembers(String column, String keyword);
}
