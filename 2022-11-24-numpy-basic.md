# 배열 만들기


```python
import numpy as np
```

## .array

### 1차원 배열


```python
np.array([1,2,3], dtype='int32')
```




    array([1, 2, 3], dtype=int32)



### 2차원 배열


```python
np.array(([1,2,3,],[4,5,6]))
```




    array([[1, 2, 3],
           [4, 5, 6]])



### 3차원 배열


```python
np.array(([[1,2,3,],[4,5,6]],[[7,8,9],[10,11,12]]))
```




    array([[[ 1,  2,  3],
            [ 4,  5,  6]],
    
           [[ 7,  8,  9],
            [10, 11, 12]]])



## .arange

시작과 끝, step을 지정해줄 수 있다. 그러면 numpy가 알아서 넣어준다.


```python
np.arange(10,20,2)
```




    array([10, 12, 14, 16, 18])



## .linespace

시작과 끝, 원소의 개수를 지정하면 원소간 균등한 거리로 생성된다.


```python
np.linspace(1,10,10, dtype='int16')
```




    array([ 1,  2,  3,  4,  5,  6,  7,  8,  9, 10], dtype=int16)



## .zeros, .ones, .full

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



같은 숫자를 넣는것도 가능하다.


```python
np.full((3,5),5)
```




    array([[5, 5, 5, 5, 5],
           [5, 5, 5, 5, 5],
           [5, 5, 5, 5, 5]])



<br>

<br>

# 배열 모양 바꾸기

## .reshape


```python
a = np.arange(24)
a
```




    array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
           17, 18, 19, 20, 21, 22, 23])




```python
a.reshape(2,12)
```




    array([[ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11],
           [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]])




```python
a.reshape(2,3,4)
```




    array([[[ 0,  1,  2,  3],
            [ 4,  5,  6,  7],
            [ 8,  9, 10, 11]],
    
           [[12, 13, 14, 15],
            [16, 17, 18, 19],
            [20, 21, 22, 23]]])




```python
a = np.arange(12)
a
```




    array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11])




```python
a.reshape(-1)
```




    array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11])




```python
a.reshape(-1,1)
```




    array([[ 0],
           [ 1],
           [ 2],
           [ 3],
           [ 4],
           [ 5],
           [ 6],
           [ 7],
           [ 8],
           [ 9],
           [10],
           [11]])




```python
a.reshape(-1,2)
```




    array([[ 0,  1],
           [ 2,  3],
           [ 4,  5],
           [ 6,  7],
           [ 8,  9],
           [10, 11]])




```python
a.reshape(-1,3)
```




    array([[ 0,  1,  2],
           [ 3,  4,  5],
           [ 6,  7,  8],
           [ 9, 10, 11]])




```python
a.reshape(-2,2,3)
```




    array([[[ 0,  1,  2],
            [ 3,  4,  5]],
    
           [[ 6,  7,  8],
            [ 9, 10, 11]]])



## .T(Transpose)


```python
a = np.arange(6).reshape(2,3)
a
```




    array([[0, 1, 2],
           [3, 4, 5]])




```python
a.T
```




    array([[0, 3],
           [1, 4],
           [2, 5]])



<br>

<br>

# 배열 합치기

## 1차원


```python
a = np.arange(5)
a
```




    array([0, 1, 2, 3, 4])




```python
np.concatenate((a,a), axis=None)
```




    array([0, 1, 2, 3, 4, 0, 1, 2, 3, 4])




```python
np.concatenate((a,a), axis=0)
```




    array([0, 1, 2, 3, 4, 0, 1, 2, 3, 4])




```python
np.hstack((a,a))
```




    array([0, 1, 2, 3, 4, 0, 1, 2, 3, 4])




```python
np.vstack((a,a))
```




    array([[0, 1, 2, 3, 4],
           [0, 1, 2, 3, 4]])




```python
np.stack((a,a), axis=0)
```




    array([[0, 1, 2, 3, 4],
           [0, 1, 2, 3, 4]])




```python
np.stack((a,a), axis=1)
```




    array([[0, 0],
           [1, 1],
           [2, 2],
           [3, 3],
           [4, 4]])




```python
np.dstack((a,a))
```




    array([[[0, 0],
            [1, 1],
            [2, 2],
            [3, 3],
            [4, 4]]])



## 2차원


```python
a = np.arange(6).reshape(2,3)
a
```




    array([[0, 1, 2],
           [3, 4, 5]])




```python
np.concatenate((a,a), axis=None)
```




    array([0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5])




```python
np.concatenate((a,a), axis=0)
```




    array([[0, 1, 2],
           [3, 4, 5],
           [0, 1, 2],
           [3, 4, 5]])




```python
np.concatenate((a,a), axis=1)
```




    array([[0, 1, 2, 0, 1, 2],
           [3, 4, 5, 3, 4, 5]])




```python
np.hstack((a,a))
```




    array([[0, 1, 2, 0, 1, 2],
           [3, 4, 5, 3, 4, 5]])




```python
np.vstack((a,a))
```




    array([[0, 1, 2],
           [3, 4, 5],
           [0, 1, 2],
           [3, 4, 5]])




```python
np.stack((a,a), axis=0)
```




    array([[[0, 1, 2],
            [3, 4, 5]],
    
           [[0, 1, 2],
            [3, 4, 5]]])




```python
np.stack((a,a), axis=1)
```




    array([[[0, 1, 2],
            [0, 1, 2]],
    
           [[3, 4, 5],
            [3, 4, 5]]])




```python
np.dstack((a,a))
```




    array([[[0, 0],
            [1, 1],
            [2, 2]],
    
           [[3, 3],
            [4, 4],
            [5, 5]]])



<br>

<br>

# 배열 나누기

## 1차원


```python
a = np.arange(10)
a
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])




```python
np.array_split(a,2,axis=0)
```




    [array([0, 1, 2, 3, 4]), array([5, 6, 7, 8, 9])]




```python
np.hsplit(a,2)
```




    [array([0, 1, 2, 3, 4]), array([5, 6, 7, 8, 9])]



## 2차원


```python
a = np.arange(12).reshape(3,4)
a
```




    array([[ 0,  1,  2,  3],
           [ 4,  5,  6,  7],
           [ 8,  9, 10, 11]])




```python
np.array_split(a,3,axis=0)
```




    [array([[0, 1, 2, 3]]), array([[4, 5, 6, 7]]), array([[ 8,  9, 10, 11]])]




```python
np.vsplit(a,3)
```




    [array([[0, 1, 2, 3]]), array([[4, 5, 6, 7]]), array([[ 8,  9, 10, 11]])]




```python
np.array_split(a,2,axis=1)
```




    [array([[0, 1],
            [4, 5],
            [8, 9]]),
     array([[ 2,  3],
            [ 6,  7],
            [10, 11]])]




```python
np.hsplit(a,2)
```




    [array([[0, 1],
            [4, 5],
            [8, 9]]),
     array([[ 2,  3],
            [ 6,  7],
            [10, 11]])]


