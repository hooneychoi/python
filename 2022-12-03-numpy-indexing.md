# 1차원(백터)


```python
import numpy as np
```

여긴 간단하게만 보고 넘어가자.


```python
a = np.arange(10)
print(a)
print('')
print('a[3] : {0}'.format(a[3]))
print('a[-3] : {0}'.format(a[-3]))
print('a[3:] : {0}'.format(a[3:]))
print('a[-3:] : {0}'.format(a[-3:]))
print('')
print('a[5:7] : {0}'.format(a[5:7]))
print('a[5:7:] : {0}'.format(a[5:7:]))
print('')
print('a[::2] : {0}'.format(a[::2]))
```

    [0 1 2 3 4 5 6 7 8 9]
    
    a[3] : 3
    a[-3] : 7
    a[3:] : [3 4 5 6 7 8 9]
    a[-3:] : [7 8 9]
    
    a[5:7] : [5 6]
    a[5:7:] : [5 6]
    
    a[::2] : [0 2 4 6 8]


<br>

<br>

# 2차원, 3차원

>an array of an array of an array

3차원은 axis가 세개다.

편의상 가장 밖의 array는 page라고 칭하겠다.

3d array는 2d array 두개 이상이 겹쳐져 있는 모양이다.

- axis 0 = depth or page
- axis 1 = height or row
- axis 2 = width or column

각 axis는 콤마로 access할 수 있다.

예를들어 아래 3d array는 4*5 모양의 array 세개가 겹쳐져 있는 모양.


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
    


## 첫번째 ~ 두번째 page -> 두번째 ~ 세번째 row


```python
a[:2,1:3]
```




    array([[[ 5,  6,  7,  8,  9],
            [10, 11, 12, 13, 14]],
    
           [[25, 26, 27, 28, 29],
            [30, 31, 32, 33, 34]]])



## 첫번째 page -> 첫번째 row -> 첫번째 column


```python
a[0,0,0]
```




    0



## 모든 page -> 첫번째 row -> 첫번째 column


```python
a[:,0,0]
```




    array([ 0, 20, 40])



## 모든 page -> 세번째 row -> 네번째 ~ 마지막 column


```python
a[:,2,3:]
```




    array([[13, 14],
           [33, 34],
           [53, 54]])



<br>

<br>

# 조건에 맞는 원소 선택


```python
a = np.arange(10,10+(2*3*5)).reshape(2, 3, 5)
a
```




    array([[[10, 11, 12, 13, 14],
            [15, 16, 17, 18, 19],
            [20, 21, 22, 23, 24]],
    
           [[25, 26, 27, 28, 29],
            [30, 31, 32, 33, 34],
            [35, 36, 37, 38, 39]]])



## boolean


```python
a % 2 == 0
```




    array([[[ True, False,  True, False,  True],
            [False,  True, False,  True, False],
            [ True, False,  True, False,  True]],
    
           [[False,  True, False,  True, False],
            [ True, False,  True, False,  True],
            [False,  True, False,  True, False]]])




```python
a[a % 2 ==0]
```




    array([10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38])



## numpy.where & numpy.nonzero

조건에 맞는 array의 index를 포함하는 a tuple of arrays 를 반환한다.


```python
indices = np.where(a % 2 == 0)
indices
# for i in range(len(indices)):
#     print(indices[i])
```




    (array([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1]),
     array([0, 0, 0, 1, 1, 2, 2, 2, 0, 0, 1, 1, 1, 2, 2]),
     array([0, 2, 4, 1, 3, 0, 2, 4, 1, 3, 0, 2, 4, 1, 3]))




```python
indices = np.nonzero(a % 2 == 0)
indices
```




    (array([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1]),
     array([0, 0, 0, 1, 1, 2, 2, 2, 0, 0, 1, 1, 1, 2, 2]),
     array([0, 2, 4, 1, 3, 0, 2, 4, 1, 3, 0, 2, 4, 1, 3]))




```python
a[indices]
```




    array([10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38])



읽기 쉽게 행열좌표를 출력해보자


```python
# indices_0 = indices[0].reshape(-1,1)
# indices_1 = indices[1].reshape(-1,1)
# indices_2 = indices[2].reshape(-1,1)
# np.hstack([indices_0,indices_1,indices_2])

np.transpose(indices)
```




    array([[0, 0, 0],
           [0, 0, 2],
           [0, 0, 4],
           [0, 1, 1],
           [0, 1, 3],
           [0, 2, 0],
           [0, 2, 2],
           [0, 2, 4],
           [1, 0, 1],
           [1, 0, 3],
           [1, 1, 0],
           [1, 1, 2],
           [1, 1, 4],
           [1, 2, 1],
           [1, 2, 3]])



### 치환

TSQL의 iif처럼 쓸 수 있다.


```python
a = np.arange(100,110)
a
```




    array([100, 101, 102, 103, 104, 105, 106, 107, 108, 109])



"만약 a가 짝수면 -1로 바꾸고 아니면 a를 반환하라"


```python
a = np.where(a%2==0,-1,a)
a
```




    array([ -1, 101,  -1, 103,  -1, 105,  -1, 107,  -1, 109])



<br>

<br>

# Advanced indexing

인덱스 지정할 때 array를 넣으면 어떻게 될까?


```python
a = np.arange(100,110)
a
```




    array([100, 101, 102, 103, 104, 105, 106, 107, 108, 109])



위에서 살펴본 numpy.where는 array의 index 출력했다.

원소 값을 출력한 게 아니다!


```python
np.where(a%2==0)
```




    (array([0, 2, 4, 6, 8]),)



<br>

그럼 이렇게 넣으면 될까?

`a[0, 2, 4, 6, 8]`

그럼 에러가 발생한다!

*IndexError: too many indices for array: array is 1-dimensional, but 5 were indexed*

1d array에 콤마로 access했기 때문이다.

헷갈리기 딱 쉽네.

<br>

이렇게 하나의 array 오브젝트를 넣어야 한다.

`a[[0, 2, 4, 6, 8]]`

numpy.where는 array를 반환했으니 그대로 넣어보자.


```python
np.where(a%2==0)
```




    (array([0, 2, 4, 6, 8]),)




```python
a[np.where(a%2==0)]
```




    array([100, 102, 104, 106, 108])




```python
a[[0, 2, 4, 6, 8]]
```




    array([100, 102, 104, 106, 108])



<br>

<br>


```python
a = np.arange(10).reshape(5,2)
a
```




    array([[0, 1],
           [2, 3],
           [4, 5],
           [6, 7],
           [8, 9]])




```python
a[1,-1]
```




    3




```python
a[np.array([1, -1])]
# a[1::3]
```




    array([[2, 3],
           [8, 9]])



<br>

<br>


```python
a = np.arange(35).reshape(5, 7)
a
```




    array([[ 0,  1,  2,  3,  4,  5,  6],
           [ 7,  8,  9, 10, 11, 12, 13],
           [14, 15, 16, 17, 18, 19, 20],
           [21, 22, 23, 24, 25, 26, 27],
           [28, 29, 30, 31, 32, 33, 34]])




```python
a[[1,3]]
```




    array([[ 7,  8,  9, 10, 11, 12, 13],
           [21, 22, 23, 24, 25, 26, 27]])




```python
a[[1,3],[0,5]]
```




    array([ 7, 26])




```python
a[[1,3],0]
```




    array([ 7, 21])



<br>

<br>


```python
a = np.arange(3*4*5).reshape(3,4,5)
a
```




    array([[[ 0,  1,  2,  3,  4],
            [ 5,  6,  7,  8,  9],
            [10, 11, 12, 13, 14],
            [15, 16, 17, 18, 19]],
    
           [[20, 21, 22, 23, 24],
            [25, 26, 27, 28, 29],
            [30, 31, 32, 33, 34],
            [35, 36, 37, 38, 39]],
    
           [[40, 41, 42, 43, 44],
            [45, 46, 47, 48, 49],
            [50, 51, 52, 53, 54],
            [55, 56, 57, 58, 59]]])




```python
a[[0,1]]
```




    array([[[ 0,  1,  2,  3,  4],
            [ 5,  6,  7,  8,  9],
            [10, 11, 12, 13, 14],
            [15, 16, 17, 18, 19]],
    
           [[20, 21, 22, 23, 24],
            [25, 26, 27, 28, 29],
            [30, 31, 32, 33, 34],
            [35, 36, 37, 38, 39]]])




```python
a[[0,1],[0,1]]
```




    array([[ 0,  1,  2,  3,  4],
           [25, 26, 27, 28, 29]])




```python
a[[0,1],[0,1],[2,3]]
```




    array([ 2, 28])




```python
a[[0,1],0]
```




    array([[ 0,  1,  2,  3,  4],
           [20, 21, 22, 23, 24]])




```python
a[[0,1],0,1]
```




    array([ 1, 21])


