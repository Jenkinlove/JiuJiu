package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

@Setter
@Getter
@Component("user")
public class User {
    private Integer uid;
    @NotBlank(message = "姓名不能为空")
    private String username;
    @NotBlank(message = "密码不能为空")
    @Length(min = 8,max = 15,message = "密码位数必须在8到15位")
    private String password;
    @Email(message = "邮箱格式不正确")
    private String email;
    private String uimage;

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
