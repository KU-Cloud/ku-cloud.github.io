# Quick Menu for Updating Data

- [Seminar](/_data/seminars.yaml)
- [Member](/_data/members.yaml)
- [Project](/_data/projects.yaml)
- [Pub-International-Journal](/_data/publications-ji.yaml)
- [Pub-International-Conference](/_data/publications-ci.yaml)
- [Pub-Domestic-Journal](/_data/publications-jd.yaml)
- [Pub-Domestic-Conference](/_data/publications-cd.yaml)

# For Maintainers

홈페이지를 유지보수하는 메인테이너를 위한 안내서.

# Table of Contents

- [Quick Menu for Updating Data](#quick-menu-for-updating-data)
- [For Maintainers](#for-maintainers)
- [Table of Contents](#table-of-contents)
- [Getting Started](#getting-started)
  - [Prerequisition](#prerequisition)
  - [Serve on Localhost using Jekyll](#serve-on-localhost-using-jekyll)
  - [Directory Structure](#directory-structure)
  - [Liquid](#liquid)
- [Data Schema](#data-schema)
  - [Member (member.yaml)](#member-memberyaml)
  - [Project (projects.yaml)](#project-projectsyaml)
  - [Seminar (seminars.yaml)](#seminar-seminarsyaml)
  - [Posts (under /\_posts)](#posts-under-posts)
  - [Publication (publications-\*.yaml)](#publication-publications-yaml)
- [How to Build Publications](#how-to-build-publications)
- [Examples of Updating Data](#examples-of-updating-data)
  - [Seminar](#seminar)
  - [Member](#member)
  - [Project](#project)
  - [Publication](#publication)
- [If You Make a Huge Mistake](#if-you-make-a-huge-mistake)

# Getting Started

Member, Project, 또는 Seminar 정보 수정은 GitHub에서 웹 인터페이스로 직접 수정가능.
데이터 스키마를 [여기](#data-schema)서 참고하고 나서 GitHub에서 직접 수정하는 방법을 [여기](https://help.github.com/en/articles/editing-files-in-your-repository)서 참고.
Publication 정보도 GitHub에서 직접 수정가능하나, Forward Compability를 위해 추천하지 않음.

**홈페이지 디자인 수정은 업데이트 전 수정하고자 하는 바가 올바르게 적용되었는지 확인하기 위해 직접 수정을 하지 말고 아래 설명을 반드시 읽어보길 바람.**

## Prerequisition

Essentials

- [Jekyll](https://jekyllrb.com/) >= 3.7.4 (see [GitHub Pages dependency list](https://pages.github.com/versions/))
  - [Ruby](https://www.ruby-lang.org/en/) >= 2.5.1 ()
- [Git](https://git-scm.com/) >= 2.17.1

Optionals

- [Node.js](https://nodejs.org/ko/) >= 8.12.1
  - npm >= 6.4.1 (Node.js 설치시 함께 설치됨)
- [jq](https://stedolan.github.io/jq/) >= 1.5-1
- [Visual Studio Code](https://code.visualstudio.com/) >= 1.32.2

`Jekyll`은 정적 페이지 생성기로, HTTP Serving 기능을 내장하고 있음. 홈페이지 디자인 수정 전 로컬에서 확인하기 위해 필요함. `Ruby`는 `Jekyll`을 실행하기 위해 필요함.

`Git`은 홈페이지 Source의 버전관리와 GitHub에 업데이트된 버전을 업로드하기 위해 필요함.

`Node.js` .bib파일로 저장된 Publication 정보를 `Jekyll`에서 사용하기 위해 .json으로 변환하기 위한 유틸리티를 사용하기 위해 필요함.

`jq`는 JSON관련 유틸리티임. .bib에서 변환된 .json은 압축된 형태로, 가독성 향상을 위해 formatting을 하는데 필요함.

`Visual Studio Code`(`vscode`)는 텍스트 에디터로 개발의 편의를 위해 필요함.
본 안내서에서 `Git`에 관한 내용을 다루지 않는다.
`vscode`는 `Git` 인터페이스가 내장되어 있다.
따라서 `git` CLI에 익숙하지 않다면 설치하자.

## Serve on Localhost using `Jekyll`

```sh
# 홈페이지 Source 다운로
git clone https://github.com/KU-Cloud/ku-cloud.github.io.git
cd ku-cloud.github.io
# Jekyll 서버 실행
jekyll serve
```

정적 페이지가 생성된 후 `http://localhost:4000`으로 접속하면 로컬에서 Serving되는 웹 페이지에 접근할 수 있다.

서버를 종료하지 않고 `Jekyll` Workspace의 파일이 수정되면 자동으로 업데이트 된다. 해당 기능을 끄기 위해서는 `jekyll serve --no-watch`로 서버를 켜면된다.

## Directory Structure

본 섹션에서는 프로젝트 루트 디렉터리, 그러니까 좀 전에 `git clone`으로 다운로드 받은 폴더 `/path/to/ku-cloud.gitbut.io`폴더에 존재하는 파일과 폴더에 대해서 설명한다.
참고로 파일 또는 폴더 이름이 '\_' 문자로 시작하는 것은 `Jekyll`이 Serving하지 않는다.

`*.html`

> 프로젝트 루트디렉터리에 위치한 .html 파일은 홈페이지 각 페이지의 View이다. 즉, 이 파일을 수정하면 해당 페이지의 내용이 바뀌게 된다.
> 특히 `index.html` 파일은 메인 페이지를 가리킨다.
> 홈페이지 레이아웃은 [Bootstrap4](https://getbootstrap.com/)를 사용하였다.
> 참고로 View는 HTML 뿐 아니라 Markdown(.md)로도 작성될 수 있다.

> `Jekyll`은 빌드시 View로 사용할 .html 파일에 대해 Front Matter는 헤더를 작성할것을 강제하고있다.
> Front Matter각 작성되지 않은 .html 파일은 View로 렌더링되지 않는다.
> 자세한 정보는 [여기](https://jekyllrb.com/docs/front-matter/)를 참고.

`_config.yaml`

> `Jekyll`의 설정파일이다. 자세한 정보는 [여기](https://jekyllrb.com/docs/configuration/options/)를 참고.

`package.json`, `package-lock.json`

> `npm` 의존성 관리를 위한 파일.

`CNAME`

> GitHub은 이 파일에 작성된 이름으로 요청이 오면 이 프로젝트의 페이지를 반환한다.
> 홈페이지의 서브도메인 수정시 이 파일도 수정할 것.
> 서브도메인은 GitHub의 DNS주소로 리다이렉트해주어야함.

`_data/`

> 홈페이지에서 형식을 갖춘 정보들은 이 폴더에 YAML 포맷으로 존재한다.
> 참고로 YAML은 JSON의 Superset이다.

`_includes/`

> 다른 .html 파일에서 반복적으로 사용될 수 있는 템플릿 .html 파일이 존재한다.
> 예를 들어 Members 페이지를 가리키는 [member.html](/members.html) 파일을 보면, 의 각 Member 요소는 [member-group.html](/_includes/member-group.html) 템플릿을 여러번 include하여 표현되어 있다.

`_layouts/`

> 페이지의 레이아웃을 정의한 .html 파일이 존재하다.

`_publications/`

> Publications 페이지의 논문 정보를 표현하는 .bib 파일이 존재한다.

`.vscode/`

> `vscode` workspace 설정관련 폴더.

`assets/`

> 페이지에서 사용되는 js 라이브러리, css 및 이미지 파일이 존재한다.
> Memebers 페이지의 각 member 프로필은 `assets/images/members/` 폴더에 존재한다.

## Liquid

.html 파일을 보면 `{{ ... }}` 또는 `{% ... %}`를 볼 수 있는데, 이는 `Jekyll`에서 사용하는 Template Engine인 Liquid 문법이다.
자세한 정보는 [여기](https://shopify.github.io/liquid/)를 참고.
`Jejyll`은 Liquid에서 기본적으로 제공하는 것 이외에 몇가지 Fiter와 Tag를 추가로 제공한다. 자세한 정보는 [여기](https://jekyllrb.com/docs/liquid/)를 참고.

# Data Schema

## Member ([member.yaml](/_data/members.yaml))

position `member[]`

member  
├ name `string` 이름  
├ mail `string` 메일 주소  
├ cover `string` 프로필 사진 위치  
├ work `string[]` 직장  
└ research `string[]` 연구 분야

최상위 수준은 `member[]`를 값으로 하며 `phd`, `master`, `alumniPhd`, 그리고 `alumniMaster`를 key로 하는 `object`이다.
각각 박사, 석사, 박사 졸업생, 그리고 석사 졸업생을 의미한다.

> `member.cover` 필드가 비어있으면 "/assets/images/members/\{member.name\}.jpg"를 사용한다.

> `member.cover`에 명시된 파일이 존재하지 않으면 "/assets/images/members/default.png"를 사용한다.

> `member.work` 필드가 존재하면 `member.research` 필드는 무시된다. [/\_includes/member-item.html](/_includes/member-item.html) 참고.
>
> View에서 Item 순서로 출력됨.

## Project ([projects.yaml](/_data/projects.yaml))

project  
├ title `string` 제목  
├ role `"rep"|"corep"|string` 참여 구분  
├ sponsor `sponsor` 발주 기관  
├ start `date` 시작 날짜  
└ end `date` 종료 날짜

sponsor  
├ short `string` 두문자어  
└ full `string` 정식 명칭

최상위 수준은 `project[]`이다.

> `project.role` 필드가 "rep" 또는 "corep"이면 View에서 각각 "책임" 또는 "공동"으로 표시된다.

> `sponsor.short` 필드의 값은 화면이 작으면(모바일) 출력된다.
> 값이 없으면 `sponsor.full`이 출력된다.
> [/\_include/project-item.html](/_include/project-item.html) 참고.
> (TODO: 구현되지 않음)

> View에서 시간순으로 정렬하므로 기입 순서 상관 없음.

## Seminar ([seminars.yaml](/_data/seminars.yaml))

seminar  
├ title `string` 제목  
├ speacker `string` 발표자  
├ date `date+time` 발표 날짜  
└ location `string` 발표 장소

최상위 수준은 `seminar[]`이다.

> `seminar.date`는 Asia/Seoul 시간대를 기준으로 작성하며 +0900 Offset 반드시 명시.

> View에서 시간순으로 정렬하지 않으므로 반드시 시간순으로 기입. (최신 정보가 파일의 아래에)

## Posts (under /\_posts)

News는 `.yaml`이 아닌 마크다운(`.md`) 또는 HTML로 작성되어야한다. [Front Matter](https://jekyllrb.com/docs/front-matter/)의 scheme은 다음과 같다.

layout: news
title: `string` News 제목
categories: `string`[]
cover:
src: `string` 커버 이미지 주소
alt: `string` 커버 이미지 설명

파일 제목은 YYYY-MM-DD-Title.[.md|.html]의 형식이며, 자세한 사항은 [여기](https://jekyllrb.com/docs/posts/) 참고.

Post에 사용되는 Resourc(이미지, 첨부파일 등)은 가능하면 외부 링크를 자제하고 `/assets/posts/{카테고리 이름}/{파일 제목}` 폴더에 저장하길 바람.

> News는 category 이름으로 "news"를 사용한다.

## Publication (publications-\*.yaml)

해당 파일은 유틸리티를 이용해 자동 생성된 파일임.
직접 수정시 JSON 포맷에 유의하여 알아서 잘 수정해주길 바람...

**업데이트한 정보는 Forward Compability를 위해 반드시 해당하는 bib 파일을 "/\_publications/.../" 폴더에 넣어주길 바람.
bib 파일이 존재하지않으면 향후 자동 생성시 정보가 누락됨.**

자동 생성하는 방법은 여기를 참고.

# How to Build Publications

빌드 스크립트는 "/\_publication/build.sh"이다. 빌드하기 위해선 `Node.js`와 `jq`가 반드시 필요하다. 두가지를 설치했으면 프로젝트 루트 디렉터리에서 다음 명령어를 실행해서 필요한 유틸리지를 설치하자.

```sh
# 프로젝트 루트 디렉터리에서 (즉, package.json 파일이 위치한 디렉터리에서)
npm install
```

"/\_publication/build.sh"을 보면 파일 하단에 5줄씩 각주가 되어 있다. 빌드가 필요한 부분에 각주를 지우고 실행하자. (당연히 해당 폴더에 업데이트할 bib 파일이 넣어주고나서 실행해야한다.)

> bib 파일에 문제가 있다면 스크립트 실행중 "Uncaught..."가 출력된다.
> 새로 추가한 파일에 문법 문제가 있을것이므로 확인바람.

# Examples of Updating Data

## Seminar

```yaml

---
# 파일의 끝에 추가
- title: 오늘의 곰국
  speaker: 홍길동
  date: 2019-03-15T19:00:00.000+0900
  location: 라이시움 408호
```

## Member

```yaml
# 석사 신입생의 경우
master:
  ...
# master 최하단에 추가
  - name: 홍길동
    mail: gildong@korea.ac.kr
    research:
      - 축지법
      - 분신술
# Indentation 유의
```

## Project

```yaml

---
# 파일의 끝에 추가
- title: 난해한 제목의 과제
  sponsor:
    short: MND
    full: 국방부
  start: 2019-03-01
  end: 2024-02-31
  role: rep
# Indentation 유의
```

## Publication

> **bib 파일을 해당하는 범주의 폴더에 넣어두고 나서**

> 국제 저널: `/_publications/journal/international/`  
> 국내 저널: `/_publications/journal/domestic/`  
> 국제 컨퍼런스: `/_publications/conference/international/`  
> 국내 컨퍼런스: `/_publications/conference/domestic/`

```yaml
# 국제 저널의 경우
[
  ...
    }
  },
# 위치 상관 없음
  {
    "author": [
      {
        "given": "Gildong",
        "family": "Hong"
      },
      {
        "given": "Heonchang",
        "family": "Yoo"
      }
    ],
    "title": "The title looks complicated",
    "publisher": "Journal of Parallel and Distributed Computing",
    "volume": "42",
    "issue": "13",
    "page": "69-74",
    "issued": {
      "date-parts": [
        [2019]
      ]
    }
  },
# Indentation 상관 없음
# 괄호, 쉼표, 따옴표 유의
  {
    {
  ...
]
```

```yaml
# 국내 컨퍼런스의 경우
[
  ...
    }
  },
# 위치 상관 없음
  {
    # 이름을 `family` 필드에만
    "author": [
      {
        "family": "홍길동"
      },
      {
        "family": "유헌창"
      }
    ],
    "title": "복잡해 보이는 제목",
    "publisher": "2019 춘계 정보처리학회",
    "volume": "42",
    "issue": "13",
    "page": "69-74",
    "issued": {
      "date-parts": [
        [2019]
      ]
    }
  },
# Indentation 상관 없음
# 괄호, 쉼표, 따옴표 유의
  {
    {
  ...
]
```

# If You Make a Huge Mistake

당황하지 말고 `Git`으로 변경내용을 취소하거나, 이미 커밋했다면 롤백하자.
