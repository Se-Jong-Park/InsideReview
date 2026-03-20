package com.jeonju.movie.rating.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeonju.movie.comm.Chaebun;
import com.jeonju.movie.rating.dao.RatingDAO;
import com.jeonju.movie.rating.vo.RatingVO;

@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    private RatingDAO ratingDAO;

    @Override
    public boolean insertRating(RatingVO vo) {
        // 이미 별점 등록했으면 차단
        int already = ratingDAO.checkRating(vo);
        if (already > 0) return false;

        int maxno = ratingDAO.getMaxNo();
        vo.setRatno(Chaebun.getRatno(maxno));   // 채번: R20250313001
        ratingDAO.insertRating(vo);
        return true;
    }

    @Override
    public double getAvgScore(String mno) {
        return ratingDAO.getAvgScore(mno);
    }
}
