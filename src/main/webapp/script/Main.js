  new Swiper('.swiper-container', {
    slidesPerView: 'auto', //한번에 보여줄 요소 갯수. auto 설정가능
    spaceBetween: 0, //슬라이드간 padding값
    loop: true, //loop > true는 무한반복
    autoplay: {
      delay: 3000, //3초에 한번씩 자동으로 슬라이드
    },
  });