package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Setter
@Getter
@Component("user")
public class User {
    private Integer uid;
    @NotBlank(message = "��������Ϊ��")
    private String username;
    @NotBlank(message = "���벻��Ϊ��")
    @Length(min = 8,max = 15,message = "����λ��������8��15λ")
    private String password;
    @NotBlank(message = "���䲻��Ϊ��")
    @Email(message = "�����ʽ����ȷ")
    private String email;
    private String uimage;

    //һ���û���Ӧ�������
    private Set<Entangler> entanglers=new HashSet<>();

    //һ���û���Ӧ�������
    private Set<EntanglerComment> comments=new HashSet<>();

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", uimage='" + uimage + '\'' +
                '}';
    }
}
