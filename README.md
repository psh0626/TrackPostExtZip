# <div style="display:flex; align-items: end;"> <img width="32" src="/icon.png"/>  TrackPost 확장프로그램 </div>
**IMIC TrackPost**는 GCSS, iCare 등 국제우편 업무 시스템에서의 반복되는 작업을 자동화하는 Chrome/Edge 확장프로그램입니다.
미확인 회신, 문의, 통지 등을 자동으로 확인·알림하고, 한국발 우편물의 정보 확인, Request 작성시 필수 항목 자동 입력, 환율 계산 등 조사 업무의 효율을 높이는 다양한 기능을 제공합니다.
<br /><br />
## 기능
- 미확인 메시지 자동 조회/알림
- Popup UI로 미확인 메시지를 한눈에 확인 (등기번호 복사/ 국가 복사/ 모두 열기 기능 제공)
- Popup UI에 등기번호를 입력하면 국내 접수 정보 조회 (Sidepanel에 표시)
- 상대국 조사 요청시 필수 정보 자동 입력 및 SDR 환율 계산
- iCare에 Personal remarks 기능 추가
- GCSS SUM 페이지에 마지막 작성자 표시 기능 추가
- GCSS iCare 각 웹사이트 등기번호 입력탭에 자동 대문자 기능 등 각종 편의기능 제공
- 미확인 메시지/Personal remarks/환율 등 관련 설정 페이지 제공
- 공직자통합메일/포사웹메일 로그아웃 되지 않게 주기적으로 새로고침, 미확인 이메일 수를 제목에 표시
<br /><br />

## 설치 방법 
>[!Note]
>1. 바탕화면 등에 새폴더를 만들고, [dist.zip](https://github.com/psh0626/TrackPostExtZip/releases "확장프로그램 다운로드") 파일을 압축 해제합니다.
>1. [TrackPostExtUpdator.exe](https://github.com/psh0626/TrackPostExtUpdator/releases "업데이터 다운로드")를 dist 폴더 옆에 둡니다. [(사진 확인)](https://github.com/user-attachments/assets/7b03bb56-355c-4b4a-af73-f856a4123f35)
>1. 엣지/크롬 실행 후 ...을 누른 뒤 확장 -> 확장 관리를 들어갑니다.
>1. 왼쪽에 개발자 모드를 활성화 시킨 뒤 압축 풀린 파일 로드 버튼을 눌러 1번에 압축 해제한 dist 폴더를 선택합니다.
>1. 설치 완료!
<br /><br />
  
## 설치 후 설정
>### 알림 메시지 표시 방법
  >1. 윈도우+R 키 누른 후 gpedit.msc 입력 및 실행
  >2. 왼쪽에 사용자구성 -> 관리 템플릿 -> 시작메뉴 및 작업표시줄 순서로 더블클릭
  >3. "알림 및 알림 센터 제거" 를 찾아 더블클릭 후 "사용 안함"으로 변경 [(사진 확인)](https://github.com/user-attachments/assets/b59fb59f-cac0-45fd-b53e-45e085d3bdde)
  >4. 왼쪽에 시작메뉴 및 작업표시줄 밑에 알림 폴더 더블클릭
  >5. Turn off.. 타일.. 알림 모두 "사용 안함"으로 변경 [(사진 확인)](https://github.com/user-attachments/assets/a82d82b9-bb1a-4879-8f4b-72158b475232)
  
>### 중요 사이트 확장프로그램 안 꺼지게 설정
  >1. (엣지 기준) 오른쪽 위 ... 클릭
  >1. 설정 클릭
  >1. 왼쪽에 시스템 및 성능 탭 클릭
  >1. 성능 클릭
  >1. "이 사이트를 항상 활성 상태로 유지"에 GCSS, iCare, 공직자통합메일, 포사웹메일 등 사이트 등록 [(사진 확인)](https://github.com/user-attachments/assets/0067958c-586d-402f-a648-ad4b4940dd38)
<br /><br />
## 작동 화면
### Popup UI
<img width="389" alt="image" src="https://github.com/user-attachments/assets/1672e52a-9a8c-4203-b0a9-1f950fed8fc8" />
