# Coudy (Coding + Study)

Coudy는 **Coding + Study**의 합성어로, 코딩 스터디 그룹을 위한 웹 애플리케이션입니다. 스터디 그룹 관리, 실시간 채팅, 기술 블로그, 채용 공고 등의 기능을 통해 개발자들의 학습과 소통을 돕습니다.

##  주요 기능

*   **스터디 그룹 관리:** 스터디 그룹을 생성하고 멤버를 관리할 수 있습니다.
*   **실시간 채팅:** WebSocket을 기반으로 한 실시간 채팅방을 통해 스터디 멤버들과 소통할 수 있습니다.
*   **기술 블로그:** 학습한 내용이나 기술 정보를 공유하는 블로그 기능을 제공합니다.
*   **채용 공고:** 기업의 채용 정보를 확인하고 지원할 수 있습니다.

## 기술 스택

### Backend

*   Java 11
*   Spring Boot 2.7.3
*   Spring Web
*   Spring WebSocket
*   MyBatis
*   Oracle Database

### Frontend

*   JSP (JavaServer Pages)
*   JSTL (JSP Standard Tag Library)
*   Apache Tiles
*   Bootstrap
*   JavaScript
*   CKEditor

### Build Tool

*   Maven

## 시작하기

### 사전 요구 사항

*   JDK 11
*   Maven
*   Oracle Database

### 설치 및 실행

1.  **저장소 복제:**

    ```bash
    git clone https://github.com/your-username/Coudy.git
    cd Coudy
    ```

2.  **데이터베이스 설정:**

    `src/main/resources/application.yml` 파일에서 본인의 Oracle DB 환경에 맞게 데이터베이스 연결 정보를 수정합니다.

3.  **프로젝트 빌드:**

    ```bash
    mvn clean install
    ```

4.  **애플리케이션 실행:**

    ```bash
    mvn spring-boot:run
    ```

5.  **애플리케이션 접속:**

    웹 브라우저에서 `http://localhost:8080`으로 접속합니다. (포트 번호는 `application.yml`에서 변경 가능)

## 프로젝트 구조

```
Coudy/
├── src/
│   ├── main/
│   │   ├── java/kr/spring/         # Java 소스 코드
│   │   │   ├── company/            # 채용 공고 관련
│   │   │   ├── config/             # 애플리케이션 설정
│   │   │   ├── member/             # 회원 관련
│   │   │   ├── teamblog/           # 팀 블로그 관련
│   │   │   └── techblog/           # 기술 블로그 관련
│   │   ├── resources/              # 설정 및 정적 파일
│   │   │   ├── static/             # CSS, JS, 이미지 등
│   │   │   └── application.yml     # 애플리케이션 설정 파일
│   │   └── webapp/
│   │       ├── WEB-INF/views/      # JSP 뷰 파일
│   │       └── sql/                # DB 테이블 생성 스크립트
│   └── test/                       # 테스트 코드
├── pom.xml                         # Maven 프로젝트 설정 파일
└── README.md                       # 프로젝트 소개
```

## 데이터베이스

프로젝트에 필요한 테이블 스키마는 `src/main/webapp/sql/` 디렉토리의 `.sql` 파일들을 참고하여 생성할 수 있습니다.