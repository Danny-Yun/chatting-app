import 'package:flutter/material.dart';
import 'package:chatting_app/config/palette.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // Stack으로 겹겹이 쌓아올리기
      body: Stack(
        children: [
          // 1. 파란색 배경, 로고, 문구
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            // 파란색 배경 컨테이너
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.blue[800],
              ),
              // 로고 및 문구가 포함된 컨테이너
              child: Container(
                padding: EdgeInsets.only(top: 70, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 로고 컨테이너
                    Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('image/Chelsea.jpeg'),
                      ),
                    ),
                    SizedBox(height: 20),
                    // 폰트의 크기와 특징이 다른 텍스트들이 모여있는 경우 -> RichText 위젯 사용
                    RichText(
                      text: TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen
                                ? ' to The Blues chat!'
                                : ' Back, COYB!',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? 'Sign up to continue'
                          : 'Sign in to continue',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // 2. 텍스트 폼 필드
          Positioned(
            top: 280,
            // 폼 컨테이너, 하얀색 배경
            child: Container(
              padding: EdgeInsets.all(25),
              height: 300,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(
                // 수평을 중심으로(좌우로) 20씩 마진값
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // 박스 그림자 생성
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 로그인 탭
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen
                                    ? Palette.textColor1
                                    : Palette.activeColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: isSignupScreen ? 0 : 3,
                              width: 55,
                              color: Colors.yellow[600],
                            ),
                          ],
                        ),
                      ),
                      // 회원가입 탭
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: isSignupScreen ? 3 : 0,
                              width: 65,
                              color: Colors.yellow[600],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 폼 컨테이너
                  // 회원가입 페이지
                  if (isSignupScreen == true)
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Form(
                        child: Column(
                          children: [
                            // 첫 번째 텍스트 폼
                            TextFormField(
                              // 텍스트 필드 꾸미기
                              decoration: InputDecoration(
                                // 인풋 안의 아이콘 생성
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                // outline 생성
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                // placeholder 같은 역할
                                hintText: 'user name',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                // contentPadding은 텍스트 필드의 폭을 줄여주며 자주 사용된다.
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(height: 10),
                            // 두 번째 텍스트 폼
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(height: 10),
                            // 세 번째 텍스트 폼
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // 로그인 페이지
                  if (isSignupScreen == false)
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(17),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 3. 제출 버튼
          Positioned(
            top: 550,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(13),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // gradient로 여러 색상을 섞을 수 있다
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.yellow,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // 4. 구글 회원가입 버튼
          Positioned(
            top: 700,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text('or Sign up with', style: TextStyle(fontSize: 16)),
                SizedBox(height: 7),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Palette.googleColor,
                    minimumSize: Size(155, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.add),
                  label: Text('Google'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
