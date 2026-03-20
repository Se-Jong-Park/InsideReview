package com.jeonju.movie.movie.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeonju.movie.movie.dao.MovieDAO;
import com.jeonju.movie.movie.vo.MovieVO;
import com.jeonju.movie.rating.dao.RatingDAO;
import com.jeonju.movie.board.service.BoardService;
import com.jeonju.movie.board.vo.BoardVO;

@Controller
public class MainController {

    @Autowired private MovieDAO     movieDAO;
    @Autowired private RatingDAO    ratingDAO;
    @Autowired private BoardService boardService;

    @RequestMapping({"/", "/main"})
    public String main(Model model) {

        // 영화 목록 (평균 별점 포함)
        List<MovieVO> movieList = movieDAO.getMovieList();
        model.addAttribute("movieList", movieList);

        // 별점 TOP 10 랭킹
        List<MovieVO> rankingList = ratingDAO.getRankingList();
        model.addAttribute("rankingList", rankingList);

        // 최신 게시물 5개
        List<BoardVO> recentPostList = boardService.getRecentBoardList();
        model.addAttribute("recentPostList", recentPostList);

        return "main";  // WEB-INF/views/main.jsp
    }
}
