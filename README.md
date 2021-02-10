# 프로젝트 목적 
REST 방식을 공부 및 간단한 게시판을 만들어 본다.

-------
## REST 
  
  + REST란 
    - " Respresntational State Transfer" 의 약자이다. 
    - 월드 와이드 웹과 같은 분산 하이퍼 미디어 시스템을 위한 소프트웨어 아키텍처의 한 형식이다. 
    - 웹에 존재하는 모든 자원 ( 이미지, 동영상, DB 자원)에 고유한 URI를 부여해 활동하는 것으로, 자원을 정의하고 자원에 대한 주소를 지정하는 방법론을 의미한다.
    - REST의 형식을 따른 시스템을 RESTful 이라고 부른다.
    - HTTP URI 를 통해 자원을 명시하고 HTTP Method를 통해 해당 자원에 대한 CRUD Operation 을 적용한다.
  
  + CRUD Operation, HTTP Method
    1. Create : POST ( 자원 생성 )
    2. Read : GET ( 자원의 정보 조회 )
    3. Update : PUT ( 자원의 정보 업데이트 )
    4. Delete : DELETE ( 자원 삭제 ) 
    
  + REST 구성요소 
    1. 자원(Resource), URI   
      모든 자원은 고유한 ID를 가지고 ID는 서버에 존재하고 클라이언트는 각 자원의 상태를 조작하기 위해 요청을 보낸다. HTTP에서 이러한 자원을 구별하는 ID는 'Students/1' 같은 HTTP URI 이다.
    2. 행위(Verb), Method    
      클라이언트는 URI를 이용해 자원을 지정하고 자원을 조작하기 위해 Method를 사용한다. HTTP 프로토콜에서는 GET, POST, PUT, DELETE 같은 Method를 제공한다.
    3. 표현(Representation)       
      클라이언트가 서버로 요청을 보냈을 때 서버가 응답으로 보내주는 자원의 상태를 Representation 이라고 한다. REST에서 하나의 자원은 JSON, XML, TEXT, RSS 등 여러형태의 Representation으로 나타낼 수 있다.
      
  + REST의 특징 
    1. 클라이언트 / 서버구조 (Client-Server)   
      자원이 있는 Server, 자원을 요청하는 Client의 구조를 가진다.
    2. 무상태 (Stateless)     
      HTTP는 Stateless 프로토콜 이므로 REST 역시 무상태성을 가진다. 클라이언트의 Context를 서버에 저장하지 않는다.
    3. 캐시 처리 가능 (Cachealble)    
      웹 표준 HTTP 프로토콜을 그대로 사용하므로, 웹에서 사용하는 기존의 인프라를 그대로 활용 가능하다.
    4. 계층화     
      API 서버는 순수 비즈니스 로직을 수행하고 그 앞단에 사용자 인증, 암호화, 로드밸런싱 등을 하는 계층을 추가하여 구조상의 유연성을 줄 수 있다.
    5. 인터페이스 일관성 (Uniform Interface)     
      URI로 지정한 자원에 대한 조작을 통일되고 한정적인 인터페이스로 수행한다. HTTP 표준에만 따른다면 모든 플랫폼에 사용이 가능하다.
    6. 자체 표현 구조    
      동사(Method) + 명사(URI)로 이루어져있어 어떤 메서드에 무슨 행위를 하는지 알 수 있으며 REST API 자체가 매우 쉬워서 API 메세지 자체만 보고도 API를 이해할 수 있다.
      
   + REST의 장점
     1. 쉬운 사용   
      HTTP 프로토콜 인프라를 그대로 사용하므로 별도의 인프라를 구축할 필요가 없다.
     2. Clinet-Server 역활의 명확한 분리   
      Client는 REST API를 통해 Server와 정보를 주고받는다. REST의 특징인 Stateless에 따라 Server는 Client의 Context를 유지할 필요가 없다.
      3. 특정 데이터 표현을 사용가능    
      REST API는 헤더 부분에 URI 처리 메소드를 명시하고 필요한 실제 데이터를 'body'에 표현할 수 있도록 분리 시켰다. JSON, XML 등 원하는 Representation 언러로 사용 가능하다.
      
   + REST의 단점
      1. 메소드의 한계    
        REST는 HTTP 메소드를 이용하여 URI를 표현한다. 이러한 표현은 쉬운 사용이 가능하다는 장점이 있지만 반대로 메소드 형태가 제한적인 단점이 있다.
      2. 표준이 없음    
        REST는 설계 가이드일 뿐이지 표준이 아니다. 명확한 표준이 없다.
        
        
      
      
    

