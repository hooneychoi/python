```python
import numpy as np
```

---

# 배열 구조

<img src="https://predictivehacks.com/wp-content/uploads/2020/08/numpy_arrays-1024x572.png"  width="500">

<img src="https://storage.googleapis.com/lds-media/images/numpy-vector-matrix-3d-matrix.width-1200.jpg"  width="500">

2차원은 복수개의 1차원의 조합, 3차원은 복수개의 2차원의 조합.

그러므로 3차원은 axis가 세개다. 

편의상 3차원 가장 밖의 array는 page라고 칭하겠다.

- axis 0 = depth or page
- axis 1 = height or row
- axis 2 = width or column

각 axis는 콤마로 access할 수 있다.

예를들어 아래 3d array는 4*5 모양의 2d array 세개가 겹쳐져 있는 모양.


```python
a = np.arange(3*4*5).reshape(3,4,5)
print(a.shape,end='\n\n')

for i in range(a.shape[0]):
    print('{0}번째 page'.format(i+1))
    print(a[i],end='\n\n')
```

    (3, 4, 5)
    
    1번째 page
    [[ 0  1  2  3  4]
     [ 5  6  7  8  9]
     [10 11 12 13 14]
     [15 16 17 18 19]]
    
    2번째 page
    [[20 21 22 23 24]
     [25 26 27 28 29]
     [30 31 32 33 34]
     [35 36 37 38 39]]
    
    3번째 page
    [[40 41 42 43 44]
     [45 46 47 48 49]
     [50 51 52 53 54]
     [55 56 57 58 59]]
    


---

# .array

## 1차원


```python
np.array([1,2,3])
```




    array([1, 2, 3])



## 2차원


```python
np.array(([1,2,3,],[4,5,6]))
```




    array([[1, 2, 3],
           [4, 5, 6]])



## 3차원


```python
np.array(([[1,2,3,],[4,5,6]],[[7,8,9],[10,11,12]]))
```




    array([[[ 1,  2,  3],
            [ 4,  5,  6]],
    
           [[ 7,  8,  9],
            [10, 11, 12]]])



---

# .arange


```python
np.arange(10)
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])



시작과 끝, step을 지정해줄 수 있다. 그러면 numpy가 알아서 넣어준다.


```python
np.arange(10,20,2)
```




    array([10, 12, 14, 16, 18])



---

# .linespace

시작과 끝, 원소의 개수를 지정하면 원소간 균등한 거리로 생성된다.


```python
np.linspace(1,10,10)
```




    array([ 1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10.])



---

# .zeros, .ones, .full

range 지정해주는 것도 귀찮다. 모양만 지정해주자.


```python
np.zeros((3,5))
```




    array([[0., 0., 0., 0., 0.],
           [0., 0., 0., 0., 0.],
           [0., 0., 0., 0., 0.]])




```python
np.ones((3,5))
```




    array([[1., 1., 1., 1., 1.],
           [1., 1., 1., 1., 1.],
           [1., 1., 1., 1., 1.]])



지정한 값을 넣는것도 가능하다.


```python
np.full((2,3,4),'값')
```




    array([[['값', '값', '값', '값'],
            ['값', '값', '값', '값'],
            ['값', '값', '값', '값']],
    
           [['값', '값', '값', '값'],
            ['값', '값', '값', '값'],
            ['값', '값', '값', '값']]], dtype='<U1')


