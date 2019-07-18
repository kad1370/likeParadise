
< savaQuestionDataInit 메서드 >

@RequestMapping의 produces속성

* produces 속성의 역할: response의 content-type을 컨트롤한다. 
속성의 값으로 content-type과 charset을 입력해 원하는 형식으로 설정 가능
*content-type : 서버가 클라이언트에게 반환한 컨텐츠의 유형이 어떤 타입인지 알려주는 역할

- ajax에 제이슨오브젝트형식과 한국어로 리턴을 하기 위해
application/json; 타입으로 명시하고 charset을 utf-8로 설정