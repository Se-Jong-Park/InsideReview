package com.jeonju.movie.rating.service;

import com.jeonju.movie.rating.vo.RatingVO;

public interface RatingService {
    /** 별점 등록 — 이미 등록했으면 false 반환 */
    boolean insertRating(RatingVO vo);

    /** 특정 영화 평균 별점 */
    double getAvgScore(String mno);
}
