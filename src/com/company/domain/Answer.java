package com.company.domain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Answer {
    private Integer a_id;
    private String answer;

    @Override
    public String toString() {
        return "Answer{" +
                "a_id=" + a_id +
                ", answer='" + answer + '\'' +
                '}';
    }
}
