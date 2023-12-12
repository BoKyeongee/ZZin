
<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=f55951&height=300&section=header&text=찐-맛집%20매칭%20어플&fontSize=70&&fontAlignY=40&animation=fadeIn&fontColor=ffffff&desc=맛에%20진심인%20사람들을%20위한%20맛집%20플랫폼&descSize=20&descAlign=50&descAlignY=60" style="width:100%;"/>
  <img src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/ab594aea-3a37-477e-b947-c36f3d4e7eab" style="width:100%; margin-top:0;"/>
  <br/><br/>
  
  > 맛집에 ‘진심인’ 사람들을 위한 맛집 플랫폼
  <br>**개요: iOS 앱개발 프로젝트**
  <br>**개발 기간: 2023/10/10 ~ 2023/11/17(현재 업데이트 진행 중)**
  <br>**프로젝트 저장소: [🔍 Our Github](https://github.com/Team-Ddobaegi/ZZin)**
  <br>**아키텍쳐: MVC**
  <br>**서비스 주소: [💙 Go To The Appstore](https://apps.apple.com/kr/app/%EC%B0%90-%EB%A1%9C%EC%BB%AC-%EC%B6%94%EC%B2%9C-%EB%A7%9B%EC%A7%91%EC%95%B1/id6471357858)**
  <br><a href="https://www.figma.com/file/2LduyJ27Bt7mt6RRoJA0XU/ZZin?type=design&node-id=0%3A1&mode=design&t=QeYfbW3vjaUIjGEY-1)">🔗Figma 바로가기</a></br>
</div>
<br/><br/>


# 🔧 Development Environment 🔧
<b style="font-size:50px;">Framework & language</b><br/><br/>
<img src="https://img.shields.io/badge/Swift-F05138?style=plastic&logo=Swift&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/UIKit-2396F3?style=plastic&logo=UIkit&logoColor=white" style="height:25px;"/>
<br/><br/>

<b>Devops</b><br/><br/>
<img src="https://img.shields.io/badge/Jira-0052CC?style=plastic&logo=Jira&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/Notion-000000?style=plastic&logo=Notion&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/Asana-F06A6A?style=plastic&logo=Asana&logoColor=white" style="height:25px;"/><br/><br/>

<b>Library</b><br/><br/>
<img src="https://img.shields.io/badge/Firestore-FFCA28?style=plastic&logo=Firebase&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/FireStorage-FFCA28?style=plastic&logo=Firebase&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/Firebase Auth-FFCA28?style=plastic&logo=Firebase&logoColor=white" style="height:25px;"/>
<img src="https://img.shields.io/badge/NMapsMap-03C75A?style=plastic&logo=Naver&logoColor=white" style="height:25px;"/>
<br/>
<img src="https://img.shields.io/badge/SDWebImage-FF3333?style=plastic&logoColor=white" style="height:20px;"/>
<img src="https://img.shields.io/badge/FirebaseStorageUI-F7B93E?style=plastic&logoColor=white" style="height:20px;"/>
<img src="https://img.shields.io/badge/Alamofire-82BEA0?style=plastic&logoColor=white" style="height:20px;"/>
<img src="https://img.shields.io/badge/Shuffle-FA320A?style=plastic&logoColor=white" style="height:20px;"/>
<img src="https://img.shields.io/badge/Lottie-00A5BC?style=plastic&logoColor=white" style="height:20px;"/>
<img src="https://img.shields.io/badge/SnapKit-82BEA0?style=plastic&logoColor=white" style="height:20px;"/>
<br/><br/>

<b>RESTful API</b><br/><br/>
<img src="https://img.shields.io/badge/Kakao local API-FFCD00?style=plastic&logo=Kakao&logoColor=white" style="height:25px;"/><br/><br/><br/><br/>



# 🤔 Technical Decision 🤔
### 1. DB 구조 의사 결정
#### Users
<img width="572" alt="users 데이터베이스 도식화" src="https://github.com/BoKyeongee/ZZin/assets/124825477/05ca5baf-3cc7-4c8c-9f3c-0f39717fc1d1"><br/>
- 유저정보를 저장하기 위한 Firestore collection<br>
- Firebase Auth의 UID를 활용<br>
- 프로필 페이지에서 효과적으로 유저의 활동 내역을 보여주기 위해 등록한 맛집 및 리뷰의 문서명을 저장하여 접근 가능하게 함<br/><br/>

#### Reviews
<img width="604" alt="reviews 데이터베이스 도식화" src="https://github.com/BoKyeongee/ZZin/assets/124825477/9a2a47ba-3645-4f12-ac85-3839291bed34"><br/>
- 리뷰 정보를 저장하기 위한 Firestore collection<br>
- DB 상 고유값을 갖게 하기 위해 uuid를 문서명으로 채택<br>
- 추후 확장성을 고려해 uid를 문서 내 포함<br>
(팔로우 기능, 리뷰 페이지 내 프로필 등 개발 예정)
<br/><br/>

#### Places
<img width="905" alt="places 데이터베이스 도식화" src="https://github.com/BoKyeongee/ZZin/assets/124825477/752e0228-03ee-4537-ad11-dcc79ba2dd7a"><br/>
- 등록된 맛집의 정보를 저장하기 위한 Firestore collection<br>
- ```placeTelNum```의 경우 API 상 전화번호가 빈값으로 받아와지는 경우가 있기에 optional로 정함<br>
- 한 식당 내에 여러가지 리뷰 정보를 볼 수 있도록 ```rid```를 문자열 배열 형태([String])로 포함함<br>
- 식당에 대한 정보를 저장하고 이를 mapview에 나타내거나 키워드로 필터링이 가능하도록 key 설정(```companion```, ```condition```, ```kindOfFood```)<br/><br/>

### 2. 음식점 검색 API 결정
#### 기존결정: 네이버 검색 API ➡️ 카카오 로컬 API
#### 👀 초기 판단
- 네이버 지도 라이브러리를 사용했기 때문에 같은 자사의 정보 호환성을 기대하고 채택 <br>
- 검색의 결과가 네이버 혹은 네이버 지도의 결과와 유사할 것으로 예측했고 POST MAN으로 데이터를 확인 했을 때는 문제가 없어 보였음 <br/>

#### ⚠️ 문제 상황
- 네이버에서 제공하는 정보들임에도 불구하고 해당 검색 API를 통해서는 중요한 정보들이 빈 값으로 돌아오는 경우가 잦았음(전화번호, 주소 등)<br>
- 초기의 결정을 따를 경우 행정구역 정보를 저장하기 위해서는 또 다른 API를 한 번 더 이용하거나 네이버 지도 라이브러리에서 API 설정을 변경해야 했음<br>

#### ✅ API 변경 후 해결
- 지도 호환성 문제를 생각했지만 깊게 고민해보고 나니 mapView를 그릴 때는 저장된 데이터를 바탕으로 꺼내쓰기 때문에 잘 넣어만 주면 된다는 판단이 들었음. 일치하는 좌표계 값으로만 데이터를 넣어주면 빈 값보다는 데이터를 받아올 수 있는 API를 사용하는 것이 더 이득이라고 생각했음<br>
- 검색 시에 원하는 결과 값이 빈 값으로 반환되는 일이 거의 없어지고 원하는 정보들을 취득할 수 있게됨<br>
- 카카오 로컬 API를 통해서는 행정구역명 정보도 요청하고 받아볼 수 있음<br>
<br/><br/><br/><br/>

# ⚠️ Issue & Solution ⚠️
### 🤔 UX 개선을 위한 검토
#### 발생했던 이슈 혹은 고민했던 부분
- 계층화 된 페이지로 넘어간 뒤 다시 해당 페이지의 상위 페이지로 넘어갈 때 이전에 작업했던 페이지가 뜨는 현상<br>
- 사용감을 올리기 위해서 Animation을 도입할 때 가장 적절한 지연시간은 얼마 정도의 시간일까?<br>
#### 해결 방법
- 상위 계층의 페이지로 이동할 수 없도록 ```viewDidLoad```에서 tabBar의 ```isHidden```을 true 처리, ```viewWillDisappear```에서 false 처리해서 **유저의 선택에 제약을 주는 방향**으로 **의견을 제시하고 이를 반영함**<br>
- 사용자가 원하는 정보를 구획화해서 보기 쉽도록 SegmentControl을 사용하였으며, 초반에는 0.5s ~ 1s의 지연시간을 설정했으나 오히려 시선을 더 끌어 사용감을 저하시켰기에 0.3s로 변경<br>
<a href="https://www.notion.so/bo-bo-workspace/UX-580e2a6262b74b619a74045ddec7f31d?pvs=4">➡️ UX 개선 작업 전후 비교</a>

# 팀원들 별 트러블슈팅
- 이동준
<img width="1000" alt="스크린샷 2023-11-21 오후 6 04 19" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/17007b16-1637-48e7-a7b2-07de829c897b">
<img width="1000" alt="스크린샷 2023-11-21 오후 6 04 08" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/a3df9a5b-e2e4-40c6-8ed1-b6433c17e9cf">

  
- 박상우
<img width="1000" alt="스크린샷 2023-11-21 오후 6 03 40" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/226c5a56-b0b7-458f-8203-8f0658064870">

  
- 남보경
<img width="1000" alt="스크린샷 2023-11-21 오후 6 03 23" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/9739ecea-5ddd-4955-9613-b14c4f2f6fe0">
<img width="1000" alt="스크린샷 2023-11-21 오후 6 03 15" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/9fe0ae5b-6895-4dcc-99ad-a5334b36697b">

  
- 정주연
<img width="1000" alt="스크린샷 2023-11-21 오후 6 03 59" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/010d3f37-e8ad-44d5-be59-1d4980707085">
<img width="1000" alt="스크린샷 2023-11-21 오후 6 03 52" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/4f284099-e619-488c-addf-3e962d82fef0">

  
- 최영군
<img width="1227" alt="스크린샷 2023-11-21 오후 6 02 57" src="https://github.com/Team-Ddobaegi/ZZin/assets/136118540/0276840b-9cd8-48e1-85d9-9e7f781ca60e">



- Library/Framework:
  - SnapKit: UIKit에서 AutoLayout을 보다 쉽게 작성하기 위해 도입하였습니다.
  - Firestore: JSON이 아닌 document 컬렉션으로 데이터 저장을 하여 원활한 쿼리 진행, Firebase 및 초기 DB를 위해 FireStore 선정
  - Firebase Auth: 유저 정보에 대한 중복을 처리하는 알고리즘을 별도로 생성하지 않아도 되며 및 보안이 기본적으로 제공되기 때문에 선택
  - Naver Map API: 한국을 중심으로 다른 API보다 다양한 지리적 데이터와 서비스를 제공하며 보다 많은 맵 스타일, 마커 및 레이어를 커스터마이징 하는 기능을 제공하기에 선정
  - Kakao Local API: 상호명 검색 시 해당 가게의 이름과 주소, 위경도 좌표계, 전화번호, 행정구역명을 반환받기 위해 선정
  - Shuffle: 어플 컨셉과 일치하는 맛집 ‘소개’와 함께 Dynamic Interaction 경험을 최초 신규 회원 가입자에게 제공하고자 선정
  - FirebaseUI: 기본 모바일 바인딩을 제공하는 점을 활용해서 상용구 코드를 최소화 하고 간결하게 코드를 작성하기 위해 사용
  - SDWebImage: FireStorage에서 비동기적 이미지 다운로드 및 캐싱 및 FirebaseUI와 바인딩이 쉬운 점을 활용하기 위해 사용
  - Lottie: 정적인 회원가입 페이지 혹은 데이터 처리 중의 지연 시간 등에 생동감을 제공하는 에니메이션 효과 적용하여 유저의 사용자 경험을 높이기 위해 사용
  - Alamofire: 코드를 가독성 있고 간결하게 유지하고 짧은 개발 기간동안 응답 및 에러처리에 대해 대처하고자 사용

<div align="center">
  <h1>✨ 참여한 사람들 ✨<br/></h1>
<table>
  <tbody>
    <tr>
     <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/Madman-dev">
       <img src="https://avatars.githubusercontent.com/u/119504454?v=4" width="100px;" alt="이동준"/>
       <br />
         <sub>
           <b>이동준</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
       <sub>
           <b>회원관리 시스템/<br/>메인 담당</b>
       </sub>
       <br />
     </td>
    <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/angwoo0503">
       <img src="https://avatars.githubusercontent.com/u/136118540?v=4" width="100px;" alt="박상우"/>
       <br />
         <sub>
           <b>박상우</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
      <sub>
           <b>데이터 쿼리/<br/>지도 페이지 담당</b>
       </sub>
       <br />
     </td>
      <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/BoKyeongee">
       <img src="https://avatars.githubusercontent.com/u/124825477?v=4" width="100px;" alt="남보경"/>
       <br />
         <sub>
           <b>남보경</b>
           </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
        <sub>
           <b>Firebase 관련 함수/ CRUD/프로필 담당</b>
       </sub>
       <br />
     </td>
      <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/d9yarn">
       <img src="https://avatars.githubusercontent.com/u/139095760?v=4" width="100px;" alt="정주연"/>
       <br />
         <sub>
           <b>정주연</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
        <sub>
           <b>키워드 매칭 페이지/<br/>맛집 상세 페이지/<br/>UI&홍보물 디자인 담당</b>
       </sub>
       <br />
     </td>
      <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/YoungKunChoi">
       <img src="https://avatars.githubusercontent.com/u/139095481?v=4" width="100px;" alt="최영군"/>
       <br />
         <sub>
           <b>최영군</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
        <sub>
           <b>메인 페이지/<br/> 설정 페이지 담당</b>
       </sub>
       <br />
     </td>
  </tbody>
</table>
</div>
