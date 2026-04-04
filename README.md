# <div align="center"> <img align="center" width="32" src="/icon.png"/> TrackPost 확장프로그램 </div>

**IMIC TrackPost**는 GCSS, iCare 등 국제우편 업무 시스템에서 반복적으로 수행되는 조회·입력·확인 작업을 더 빠르고 편리하게 처리할 수 있도록 돕는 Chrome/Edge 확장프로그램입니다.
미확인 메시지 확인 및 알림, 국내 접수 정보 조회, 조사 요청 시 필수 항목 자동 입력, SDR 환율 계산 등 다양한 기능을 통해 국제우편 조사 업무의 효율을 높여줍니다.
<br /><br />

## 기능

- **미확인 메시지 조회 및 알림**
    - `Popup UI`에서 미확인 회신·문의·통지를 한눈에 확인할 수 있습니다.
    - `등기번호 복사`, `국가 복사`, `모두 열기` 등 빠른 처리 기능을 제공합니다.

- **국내 접수 정보 간편 조회**
    - `Popup UI`에 등기번호를 입력하면 국내 접수 정보를 조회하여 `Sidepanel`에 표시합니다.

- **상대국 조사 요청 작성 지원**
    - 조사 요청 시 필요한 항목을 자동으로 입력해 작성 시간을 줄여줍니다.
    - SDR 환율을 자동으로 계산하여 편리하게 손해배상금액을 산정할 수 있습니다.

- **GCSS · iCare 업무 편의 기능**
    - 각 웹사이트의 등기번호 입력란에서 자동 대문자 변환 등 다양한 입력 보조 기능을 제공합니다.
    - iCare `Personal Remarks` 기능을 추가로 제공합니다.
    - GCSS SUM 화면에 마지막 작성자 표시 기능을 제공합니다.

- **설정 페이지 제공**
    - `알림 설정`, `Personal Remarks`, `환율` 등 주요 기능을 한곳에서 편리하게 설정할 수 있습니다.

- **외부 메일 편의 기능**
    - `공직자통합메일` 및 `포사웹메일`이 로그아웃되지 않도록 주기적으로 새로고침합니다.
    - 미확인 이메일 수를 브라우저 제목에 표시해 빠르게 확인할 수 있습니다.
<br /><br />

## 설치 방법

> [!Note]
>
> 1.  [TrackPost-install.bat](https://github.com/psh0626/TrackPostExtZip/releases/latest/download/TrackPost-install.bat) 파일을 다운받습니다.
> 2.  다운받은 파일을 관리자 권한으로 실행합니다.
> 3.  설정을 진행하시겠습니까? 라는 문구가 나올때 엔터를 치면 각각 설정이 진행됩니다. (해당 부분 생략하려면 n 입력 후 엔터)
> 4.  모든 설정을 마친 경우 컴퓨터를 껐다가 켭니다.
> 5.  인터넷 브라우저를 실행한 뒤 <img align="center" width="16" src="/icon.png"/> 확장프로그램이 설치가 되는지 확인합니다.
> 1.  설치 완료!

<br />
<details>
<summary> [ TrackPost-install.bat ]  이 설정하는 사항들</summary>
<hr />

    
| **Windows 설정** | **Microsoft Edge 설정** | **Google Chrome 설정** |
| :--- | :--- | :--- |
| 알림 센터 활성화 | TrackPost 확장 설치 허용 목록 추가 | TrackPost 확장 설치 허용 목록 추가 |
| 토스트/앱 알림 허용 | TrackPost 확장 강제 설치 | TrackPost 확장 강제 설치 |
| 빙 검색 제안 비활성화 | 확장 업데이트 URL override 허용 | 확장 업데이트 URL override 허용 |
| 오류 보고 기능 끄기 | 개발자 도구 관련 제한 해제 | 개발자 도구 관련 제한 해제 |
|  | 탭 절전 예외 사이트 등록 | 탭 절전 예외 사이트 등록 |
|  | 툴바에 강제 표시 | 툴바에 강제 표시 |
|  | 사이드바 자동 열림 차단 해제 |  |
| 　　　　　　　　　　　　　　 | 기본 검색 엔진을 Google로 설정 　　　　　 | 　　　　 　　　　　　　　　　　　　 |




* 절전 예외 사이트
```
https://gcss.ipc.be
https://gcss-uat.ipc.be
https://icare.post
https://kmmbox.korea.kr
https://mail.posa.or.kr
```
* 확장 프로그램 정보
```
확장 ID: ceaglmnlneffokklakakncncaholckem
업데이트 확인 주소: https://raw.githubusercontent.com/psh0626/TrackPostExtZip/main/updateManifest.xml
```
</details>

<br />

## 작동 화면

### Popup UI

<img width="394" align="top" alt="image" src="https://github.com/user-attachments/assets/e6d02ac7-7d31-46fc-98d5-04eb1735c63a" />
<img width="389" alt="image" src="https://github.com/user-attachments/assets/af2d252f-f803-4d5d-9936-251ad7c498ec" />

## Sidepanel

<img height="600" alt="image" src="https://github.com/user-attachments/assets/b9c96e91-16b8-466d-8324-f6d664302290" />

## Options Page

<img width="408" alt="optionsPage" src="https://github.com/user-attachments/assets/bad6941f-f444-47d6-ad58-0d18d4b960ad" />
<img width="334" align="top" alt="image" src="https://github.com/user-attachments/assets/1c046255-725a-4cac-9ab0-497804060641" />
<img width="408" alt="image" src="https://github.com/user-attachments/assets/c846d4b1-88ee-4f02-84fe-5e5fa5225d9d" />
<img width="352" align="top" alt="image" src="https://github.com/user-attachments/assets/9e5cd142-650e-4ab1-8a7e-9ac677454edf" />


## Windows Notification

<img width="445" height="279" alt="image" src="https://github.com/user-attachments/assets/8cb8bb70-8d54-4da7-93b1-ac6479e852f5" />


