package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSessionTemplate sess;

	private static final String namespace = "org.zerock.persistence.BoardDAO";

	@Override
	public String getTime() {

		return sess.selectOne(namespace + ".getTime");

	}

	@Override
	public List<BoardVO> listAll(Criteria cri) {

		return sess.selectList(namespace + ".listAll", cri);
	}

	@Override
	public int totalCount(Criteria cri) {

		return sess.selectOne(namespace + ".totalCount", cri);
	}

	@Override
	public void creat(BoardVO vo) {

		sess.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVO read(int bno) {
		return sess.selectOne(namespace + ".readOne", bno);
	}

	@Override
	public void delete(int bno) {
		sess.delete(namespace + ".delete", bno);
	}

	@Override
	public void modify(BoardVO vo) {
		sess.update(namespace + ".update", vo);
	}

}
