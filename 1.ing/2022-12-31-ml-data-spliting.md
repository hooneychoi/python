# 헷갈리는 용어정리부터

학습, 훈련
- = train, training
- **공부**

검증, 검정
- = validatate, evaluate
- **모의고사**

평가, 테스트
- = test
- **수능**

라벨, 레이블(label), 정답, 타겟(target)
- asdf

<br>

## 검증? 평가?
**검증과 평가라는 단어를 명확히 구분할 수 있는가?**

머신러닝 필드 한정으로 어떤 데이터셋을 지칭하느냐에 따른 구분일 뿐이지 실제로 두 단어의 쓰임새는 똑같다고 해도 무방한것 같다. 헷갈리는 부분이라 [위키피디아](https://en.wikipedia.org/wiki/Training,_validation,_and_test_data_sets#Confusion_in_terminology)에도 쓰여져 있다.  다른 기술 블로그의 글들을 봐도 단어(검증, 평가, 테스트 등)를 혼동해서 사용하는 경우가 많다.

학습 데이터: 모델을 fit


나는 왜 헷갈리는 지 알 거 같다. 테스트 데이터는 가장 마지막에 한 번만 대조해보는 용도로 쓰여야 한다고 했다. 그러므로 검증의 탈을 쓴 테스트 데이터라고 봐야하겠다.

엄밀히 말해서 **테스트 데이터**는 **미래의 데이터**라고 이해해야 한다. 

**학습-검증**단계를 거치면서 최적의 모델과 파라미터를 찾는다. 정답이 정해져 있는 환경에서 이루어지는 과정이다. 여기에서는 평가라는 단어를 사용하면 안된다. 검증이라고 해야한다. 모의고사 문제 풀고 해답 맞춰보는 거랑 비슷하다.



예를들어 여기 감기 증상의 유무와 코로나 검사 결과 데이터가 있다. 이 데이터를 [학습 80 : 검증 20] 으로 분리 했다. 이 데이터는 정답(label, target)이 있는 데이터가 되겠다. **학습-검증**단계를 거치면서 최적의 모델과 파라미터를 찾는다. 정답이 정해져 있는 환경에서 이루어지는 과정이다. 엄밀히 말해서 여기에는 평가가 없다. 검증만 있을 뿐이다.

그럼 평가는 언제 하는가? 앞선 과정에서 정한 모델을 현실 데이터에 적용한 지 일주일이 지난 후 평가하는 것이다.

현실 세계에서 쓰이기 시작하고 정해진 시간이 지나 **미래에 정산된 예측 결과**라고 이해해야 한다. 이 말을 이해하기 위해 **학습-검증-평가**과정을 현실에 대입해보자. **학습-검증** 단계는 지금 할 수 있는 단계이다. 수많은 모델 중 가장 적합한 모델과 그 모델의 파라미터를 찾아가는 과정이다. 결국 이 과정은 

과거 데이터의 일부(학습 데이터)를 이용해서 모델을  나머지 데이터(학 가장 적합한 파라미터와 모델을 찾는 과정이다.


---

# 데이터셋의 분리

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf5AR-vFFcmurGsKjL6vHkjfxty2h3i8sauTtzOwGCFNABEtHm2U4f7__oHIXAnkm8aAg&usqp=CAU"  width="400">

모델을 개발하고 평가하는 방법은 보통 아래와 같다:

1. train > test
2. train > validate > test

보통은 2번을 사용하게 된다.

## 검증 세트와 테스트 세트의 차이
검증 데이터 셋은 모델 

테스트 정확도

# 데이터를 분리하는 이유

## look-ahead bias
타임 시리즈 데이터를 다룰 때 특히 주의해야하는 점인것 같다.
아직 개념 이해 못함.

## 과적합(overfitting)


## 과소적합(underfitting)

# 학습데이터를 또 분리하는 이유




---

참고:

https://algotrading101.com/learn/train-test-split/

https://www.youtube.com/watch?v=PIRQY6xmNZY