```python
import numpy as np
from numpy import random
```

https://www.datacamp.com/tutorial/numpy-random

---

# 랜덤은 언제나 랜덤인가?

컴퓨터는 0아니면 1로 만들어져 있으므로 사실상 '진짜' 랜덤은 있을 수 없다.

그러므로 랜덤 알고리즘의 인수를 지정하면 언제나 같은 랜덤 결과를 얻을 수 있다.

이것을 pseudo 랜덤이라고 한다.

그 인수는 random.seed()로 지정한다.

# seed 지정안함


```python
for i in range(3):
    print(random.rand(3))
```

    [0.81041288 0.83852744 0.90391499]
    [0.35078314 0.42757288 0.58476333]
    [0.69146153 0.01362336 0.04231039]


# seed 지정함


```python
for i in range(3):
    random.seed(42)
    print(random.rand(3))
```

    [0.37454012 0.95071431 0.73199394]
    [0.37454012 0.95071431 0.73199394]
    [0.37454012 0.95071431 0.73199394]


# 동전 던지기 실험

시행: 동전을 4회 던지는 것

시행 횟수: 10000회

성공 조건: 한 시행의 결과가 모두 앞면

<br>
<br>


상식적으로는 위 실험의 결과가 매번 달라져야하겠지만,

seed를 지정했기 때문에 언제나 0.0618이 나올 것이다.

seed를 42가 아닌 다른 값을 넣으면 또 다른 결과로 고정된다.


```python
random.seed(42)

n_all_heads = 0

# Initialize number of 4-heads trials
for _ in range(10000):
    heads = np.random.rand(4) < 0.5
    n_heads = np.sum(heads)
    if n_heads == 4:
        n_all_heads += 1

n_all_heads / 10000
```




    0.0618


