
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- board Table Create SQL
CREATE TABLE member
(
    `user_id`              VARCHAR(50)     NOT NULL    COMMENT '아이디', 
    `password`              VARCHAR(100)    NOT NULL    COMMENT '비밀번호', 
    `zip_code`         VARCHAR(10)     NULL        COMMENT '우편번호', 
    `address`         VARCHAR(100)    NULL        COMMENT '주소', 
    `address_detail`  VARCHAR(100)    NULL        COMMENT '상세주소', 
    `insert_time`  DATETIME         NOT NULL DEFAULT NOW()    COMMENT '등록일자', 
    `update_time`  DATETIME         NULL        COMMENT '수정일자',
	`delete_time`  DATETIME         NULL        COMMENT '삭제일자',
    PRIMARY KEY (user_id)
);

ALTER TABLE member COMMENT '회원에 관한 테이블';

-- board Table Create SQL
CREATE TABLE board
(
    `board_id`     INT              NOT NULL    AUTO_INCREMENT COMMENT '게시글ID(PK)', 
    `writer`       VARCHAR(50)      NOT NULL    COMMENT '작성자', 
    `title`        VARCHAR(50)      NOT NULL    COMMENT '제목', 
    `content`      VARCHAR(1000)    NOT NULL    COMMENT '내용', 
    `read_cnt`     INT              NOT NULL DEFAULT 0    COMMENT '조회수', 
    `reply_cnt`     INT              NOT NULL DEFAULT 0    COMMENT '댓글수',
    `insert_time`  DATETIME         NOT NULL DEFAULT NOW()    COMMENT '등록일자', 
    `update_time`  DATETIME         NULL        COMMENT '수정일자', 
    `delete_time`  DATETIME         NULL        COMMENT '삭제일자', 
    PRIMARY KEY (board_id)
);

ALTER TABLE board COMMENT 'community(자유게시판) 게시글을 위한 테이블';

ALTER TABLE board
    ADD CONSTRAINT FK_board_writer_member_user_id FOREIGN KEY (writer)
        REFERENCES member (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- board Table Create SQL
CREATE TABLE file
(
	`board_id`  INT             NOT NULL    COMMENT '게시글ID',
    `file_id`   INT             NOT NULL    AUTO_INCREMENT COMMENT '파일ID', 
    `file_name`  VARCHAR(100)    NULL        COMMENT '파일명', 
    `insert_time`   DATETIME   NOT NULL DEFAULT NOW()     COMMENT '등록일자',
    `update_time`   DATETIME   NULL     COMMENT '수정일자',
    `delete_time`   DATETIME   NULL     COMMENT '삭제일자',
    PRIMARY KEY (file_id)
);

ALTER TABLE file COMMENT '여러 개 파일 등록을 위한 테이블';

ALTER TABLE file
    ADD CONSTRAINT FK_file_board_id_board_board_id FOREIGN KEY (board_id)
        REFERENCES board (board_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- board Table Create SQL
CREATE TABLE reply
(
    `board_id`  INT              NOT NULL    COMMENT '게시글ID', 
    `reply_id`  INT              NOT NULL    AUTO_INCREMENT COMMENT '댓글ID', 
    `writer`    VARCHAR(50)      NOT NULL    COMMENT '작성자', 
    `content`   VARCHAR(1000)    NOT NULL    COMMENT '내용', 
    `insert_time`   DATETIME         NOT NULL    COMMENT '등록일자', 
    PRIMARY KEY (reply_id)
);

ALTER TABLE reply COMMENT '게시글에 대한 댓글 테이블';

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_board_id_board_board_id FOREIGN KEY (board_id)
        REFERENCES board (board_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
ALTER TABLE reply
    ADD CONSTRAINT FK_reply_writer_member_user_id FOREIGN KEY (writer)
        REFERENCES member (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- board Table Create SQL
CREATE TABLE album
(
    `album_id`      INT                        NOT NULL AUTO_INCREMENT    COMMENT '앨범ID', 
    `album_title`   VARCHAR(1000)    NOT NULL                                      COMMENT '앨범제목', 
    `artwork_name`  VARCHAR(10000)    NOT NULL                                      COMMENT '앨범사진파일이름', 
    PRIMARY KEY (album_id)
);

ALTER TABLE album COMMENT '발매앨범에 관한 테이블';

-- board Table Create SQL
CREATE TABLE track
(
    `album_id`   INT             NOT NULL    COMMENT '앨범ID', 
    `track_id`   INT             NOT NULL    COMMENT '트랙ID', 
    `track_title`      VARCHAR(1000)    NOT NULL    COMMENT '트랙제목', 
    `lyric`      VARCHAR(10000)            NOT NULL    COMMENT '가사',
    `file_name`  VARCHAR(1000)    NOT NULL        COMMENT '트랙파일명',
    PRIMARY KEY (album_id,track_id)
);

ALTER TABLE track COMMENT '앨범 수록곡에 관한 테이블';

ALTER TABLE track
    ADD CONSTRAINT FK_track_album_id_album_album_id FOREIGN KEY (album_id)
        REFERENCES album (album_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

