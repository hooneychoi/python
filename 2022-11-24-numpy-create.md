numpy.ndarry클래스 객체를 생성해보자.

1. [참고](https://numpy.org/doc/stable/reference/routines.array-creation.html#array-creation-routines)
2. [참고](https://sparkbyexamples.com/numpy/numpy-concatenate-arrays/)


```python
import numpy as np
```

<br>

<br>

# 배열 만들기

간단하게 배열이랑 배열의 차원, shape를 print하는 함수만들어서 생성할 때마다 실행해보자.


```python
def my_info(a):
    # print('a:       ',a)
    print(a)
    print('-'*30)
    print('차원:     ',a.ndim)
    print('shape:   ',a.shape)
    # print('-'*50)
    print('')
    # print('')
```

## numpy.array

### 1차원 배열


```python
a = np.array([1,2,3], dtype='int32')
my_info(a)
```

    [1 2 3]
    ------------------------------
    차원:      1
    shape:    (3,)
    


### 2차원 배열


```python
a = np.array(([1,2,3,],[4,5,6]))
my_info(a)
```

    [[1 2 3]
     [4 5 6]]
    ------------------------------
    차원:      2
    shape:    (2, 3)
    


### 3차원 배열


```python
a = np.array(([[1,2,3,],[4,5,6]],[[7,8,9],[10,11,12]]))
my_info(a)
```

    [[[ 1  2  3]
      [ 4  5  6]]
    
     [[ 7  8  9]
      [10 11 12]]]
    ------------------------------
    차원:      3
    shape:    (2, 2, 3)
    


## numpy.arange

시작과 끝, step을 지정해줄 수 있다. 그러면 numpy가 알아서 넣어준다.


```python
a = np.arange(10,20,2)
my_info(a)
```

    [10 12 14 16 18]
    ------------------------------
    차원:      1
    shape:    (5,)
    


## numpy.linespace

시작과 끝, 원소의 개수를 지정하면 원소간 균등한 거리로 생성된다.


```python
a = np.linspace(1,10,10, dtype='int16')
my_info(a)
```

    [ 1  2  3  4  5  6  7  8  9 10]
    ------------------------------
    차원:      1
    shape:    (10,)
    


## numpy.zeros & numpy.ones & numpy.full

range 지정해주는 것도 귀찮다. 모양만 지정해주자.


```python
a = np.zeros((3,5))
my_info(a)
```

    [[0. 0. 0. 0. 0.]
     [0. 0. 0. 0. 0.]
     [0. 0. 0. 0. 0.]]
    ------------------------------
    차원:      2
    shape:    (3, 5)
    



```python
a = np.ones((3,5))
my_info(a)
```

    [[1. 1. 1. 1. 1.]
     [1. 1. 1. 1. 1.]
     [1. 1. 1. 1. 1.]]
    ------------------------------
    차원:      2
    shape:    (3, 5)
    


같은 숫자를 넣는것도 가능하다.


```python
a = np.full((3,5),5)
my_info(a)
```

    [[5 5 5 5 5]
     [5 5 5 5 5]
     [5 5 5 5 5]]
    ------------------------------
    차원:      2
    shape:    (3, 5)
    


<br>

<br>

# 배열 모양 바꾸기

## numpy.reshape


```python
a = np.arange(20).reshape(4,5)
my_info(a)
```

    [[ 0  1  2  3  4]
     [ 5  6  7  8  9]
     [10 11 12 13 14]
     [15 16 17 18 19]]
    ------------------------------
    차원:      2
    shape:    (4, 5)
    


## numpy.T

"Transpose"


```python
a = np.arange(20).reshape(2,10)
my_info(a)
```

    [[ 0  1  2  3  4  5  6  7  8  9]
     [10 11 12 13 14 15 16 17 18 19]]
    ------------------------------
    차원:      2
    shape:    (2, 10)
    



```python
a.T
```




    array([[ 0, 10],
           [ 1, 11],
           [ 2, 12],
           [ 3, 13],
           [ 4, 14],
           [ 5, 15],
           [ 6, 16],
           [ 7, 17],
           [ 8, 18],
           [ 9, 19]])



<br>

<br>

# 배열 합치기

### numpy.vstack & numpy.hstack

concatenate보다 이게 더 직관적이다.


```python
a = np.arange(10)

b = np.hstack((a,a))
my_info(b)

c = np.vstack((a,a))
my_info(c)
```

    [0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9]
    ------------------------------
    차원:      1
    shape:    (20,)
    
    [[0 1 2 3 4 5 6 7 8 9]
     [0 1 2 3 4 5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (2, 10)
    



```python
a = np.arange(10).reshape(2,5)

b = np.hstack((a,a))
my_info(b)

c = np.vstack((a,a))
my_info(c)
```

    [[0 1 2 3 4 0 1 2 3 4]
     [5 6 7 8 9 5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (2, 10)
    
    [[0 1 2 3 4]
     [5 6 7 8 9]
     [0 1 2 3 4]
     [5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (4, 5)
    


### numpy.concatenate


```python
a = np.arange(10).reshape(2,5)
my_info(a)
```

    [[0 1 2 3 4]
     [5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (2, 5)
    



```python
b = np.concatenate((a,a),axis=0) # np.vstack((a,a))
my_info(b)
```

    [[0 1 2 3 4]
     [5 6 7 8 9]
     [0 1 2 3 4]
     [5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (4, 5)
    



```python
b = np.concatenate((a,a),axis=1) # np.hstack((a,a))
my_info(b)
```

    [[0 1 2 3 4 0 1 2 3 4]
     [5 6 7 8 9 5 6 7 8 9]]
    ------------------------------
    차원:      2
    shape:    (2, 10)
    

