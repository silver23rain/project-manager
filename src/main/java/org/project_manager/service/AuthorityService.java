package org.project_manager.service;

import org.project_manager.domain.UserDTO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class AuthorityService {

    public UserDTO getUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        return (UserDTO) session.getAttribute("loginUser");
    }
}
