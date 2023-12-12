
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
<br/><br/>

### 🤔 Firebase를 이용하기 위한 함수 리팩토링
#### 고민했던 부분
- DB를 가져올 때 어떤 단위로 가져와야할까?<br>
- FireStorage와 Firestore에서 데이터를 가져와서 바인딩 하는 것에 대한 고민<br>
- 데이터를 가져왔을 때 사용하는 용도에 맞게 함수를 짤 수는 없을까?<br>
- 각자의 페이지에서 중복되는 부분과 개인화할 수 있는 부분을 한 함수를 재사용해서 이용하거나, 거의 모든 페이지에 ImageView가 있는데 사진을 불러와서 바인딩하는 작업을 단축할 수는 없을까?<br>
- 프로필 페이지 내에서 어떻게 해야 사용자가 원하는 정보만을 볼 수 있게 효율적으로 데이터를 설계할까?<br>
- 데이터를 불러올 수 있는 두 가지 선택지<br>
  1. 유저 데이터에 유저가 작성한 리뷰 혹은 맛집에 대한 정보를 담은 document의 이름을 포함<br>
  2. 데이터를 가져올 때 리뷰와 맛집 collection에서 유저의 uid를 담고있는 것들을 query<br>

#### 해결 방법
- 키워드 별 정보가 필요할 때는 collection 단위에서 query 하도록 함수 작성<br>
- 유저 정보, 특정 맛집 정보, 특정 리뷰 정보 등의 정보가 필요할 때는 document 단위에서 불러올 수 있도록 함수 작성<br>
- Firestore의 함수를 통해서 정보를 불러오고 성공하면 FireStorage의 파일을 다운받아 바인딩을 하는 함수 작성함<br>
- 함수의 사용성 측면에서 고민했을 때 공통으로 재사용하기 위해 공유하는 custom cell이 있다는 특성을 적극 활용하고자 했음. 각각의 VC에서 용도에 맞게 어느정도 변경해서 사용하고 있었기 때문에 파라미터로 각각의 UI를 받고 이를 nil로도 설정할 수 있게 두고 파라미터에 같이 들어갈 firestore 문서의 id만 적절하게 잘 넣어주면 한 줄만으로 바인딩이 되게 완성함<br>
- 프로필 페이지를 그리기 위해서는 필수적으로 한 번은 Firestore에서 문서 단위로 유저의 데이터를 불러와야 했음. query를 하는 것 보다는 정확한 문서들을 가져오는 것이 낫다고 판단해서 UID를 이용한 유저 DB를 따로 설계하는 과정에서 pid와 rid를 포함(맛집에 대한 고유 값인 placeID와 리뷰에 대한 고유값인 reviewID)<br>

[➡️ Firestore 함수 관련 코드 모음](https://www.notion.so/Firestore-535d8e3abc414702aef424528395a049?pvs=21)<br>
[➡️ FireStorage 함수 관련 코드 모음](https://www.notion.so/FireStorage-3e50278e0ab245cfb5cea4cdea884bc9?pvs=21)<br/><br/>

### 🤔 리뷰 작성 페이지
#### 발생했던 이슈 혹은 고민했던 부분
- 상점 검색 시에 ‘out of range’ 오류가 발생함<br>
- 페이지의 scroll direction과 사진을 추가하는 section의 scroll direction이 달라야해서 tableView안에 collectionView를 넣었는데 여러 기능이 얽혀있어서 좀 더 구조를 단순히 만들면서 scroll direction을 유지할 방법이 없을까?<br>
- 키보드 사용 후 화면을 가장 상단으로 놓고 return키를 누르면 view가 내려가면서 검정색 화면이 뜨는 오류를 어떻게 해결해야할까?```(현재 업데이트 중에 있음)```<br>

#### 해결 방법
- print문은 정상적으로 받아와졌으나 검색결과가 많아지는 단어(예를 들면 ‘스타벅스’)가 입력되는 경우 갑작스럽게 종료가 되는 것을 볼 수 있었다. 텍스트를 입력한 것을 파라미터로 넣어서 request를 넣는데 이 결과를 받아서 reload를 하는 타이밍이 맞지 않아서 **`결과값의 수`**와과 tableView **`indexPath.row`**가 달라서 생긴 문제였다. 이를 피하기 위해 우선 completionHandler를 이용해서 요청이 완료될 경우에 reload를 하도록 했고, 추후 업데이트 시 유저 입력 후 지연시간을 부여해서 request의 횟수를 줄이는 방향도 추가할 예정 <br>
- **`NSCollectionLayoutSection`**을 사용해서 해당 section에 **`orthogonalScrollingBehavior`**를 설정해서 scroll 방향의 문제를 해결했다. item부터 group, section까지 일일히 모두 하나씩 설정을 해야한다는 번거로움은 있었으나 하나의 collectionView만을 사용할 수 있었기 때문에 파일의 수를 줄일 수 있었고 구조도 간단하게 만들면서 코드도 간결하게 변경<br>
- notification center를 통해 키보드의 길이만큼 view를 올렸다가 내렸지만 collectionView처럼 scroll이 가능한 view에서는 어떤 위치에 해당 텍스트 필드가 가있는지 알 수가 없기 때문에 이 방법은 옳지 않다고 판단했다. 원래는 스크롤방향을 기준으로 section을 나누고 기능 단위로 item을 나눴다. 하지만 textField 클릭시에 해당 텍스트 필드의 위치를 변경하기 위해 각 텍스트 필드를 item단위로 분리해야 한다고 판단했고, 특정한 y값으로 item이 이동하는 것으로 변경해서 해결함```(현재 업데이트 중에 있음)```<br>

[➡️ 리뷰 작성 페이지](https://www.notion.so/84a1386b14c94505aac0ede8398a42d4?pvs=21)<br/><br/>


### 🤔 프로필 페이지
#### 발생했던 이슈 혹은 고민했던 부분
- 프로필 이미지가 나타나지 않음<br>
- 프로필 이미지를 편집 했을 때 Firebase Storage에는 업로드 되어있으나 프로필 사진이 이전 사진으로만 계속 뜨는 현상. 일정 시간이 지나거나 어플을 삭제하고 다시 설치하면 변경되어 있음<br>
#### 해결 방법
- 회원 가입 시 유저 데이터를 만들 때 profileImg 필드가 생성되지 않아 생성되는 이슈로 받아온 유저 데이터에서 profileImg 값이 nil인 경우 기본 프로필을 띄우는 동시에 기본 프로필 사진 경로를 데이터에 저장하도록 변경함<br>
- SDWebImage 라이브러리의 캐싱으로 인해 캐시가 업데이트가 되지 않아 발생하는 문제로 파악됐음. 프로필 사진을 업로드 할 때 캐시를 업데이트 하는 코드를 작성하여 해결함<br>

<a href="https://www.notion.so/84a1386b14c94505aac0ede8398a42d4?pvs=21](https://www.notion.so/bo-bo-workspace/b36191cc6e6348c084c6ab4004916e1c">➡️ 프로필 페이지</a><br/><br/>


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
