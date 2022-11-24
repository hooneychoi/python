numpy.ndarry클래스 객체를 생성해보자.

다음 문서에서는 배열안의 원소를 select하는 걸 배워볼 것이다.

[공식문서](https://numpy.org/doc/stable/reference/routines.array-creation.html#array-creation-routines)


```python
import numpy as np
```

<br>

<br>

# 배열 만들기

간단하게 배열이랑 배열의 차원, shape를 print하는 함수를 써보자


```python
def my_info(a):
    # print('a:       ',a)
    print(a)
    print('')
    print('--------------------------------')
    print('차원:     ',a.ndim)
    print('shape:   ',a.shape)
```

## numpy.array

### 1차원 배열


```python
a = np.array([1,2,3], dtype='int32')
my_info(a)
```

    [1 2 3]
    
    --------------------------------
    차원:      1
    shape:    (3,)


### 2차원 배열


```python
a = np.array(([1,2,3,],[4,5,6]))
my_info(a)
```

    [[1 2 3]
     [4 5 6]]
    
    --------------------------------
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
    
    --------------------------------
    차원:      3
    shape:    (2, 2, 3)


## numpy.arange

시작과 끝, step을 지정해줄 수 있다. 그러면 numpy가 알아서 넣어준다.


```python
a = np.arange(10,20,2)
my_info(a)
```

    [10 12 14 16 18]
    
    --------------------------------
    차원:      1
    shape:    (5,)


## numpy.zeros & numpy.ones & numpy.full

range 지정해주는 것도 귀찮다. 모양만 지정해주자.


```python
a = np.zeros((3,5))
my_info(a)
```

    [[0. 0. 0. 0. 0.]
     [0. 0. 0. 0. 0.]
     [0. 0. 0. 0. 0.]]
    
    --------------------------------
    차원:      2
    shape:    (3, 5)



```python
a = np.ones((3,5))
my_info(a)
```

    [[1. 1. 1. 1. 1.]
     [1. 1. 1. 1. 1.]
     [1. 1. 1. 1. 1.]]
    
    --------------------------------
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
    
    --------------------------------
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
    
    --------------------------------
    차원:      2
    shape:    (4, 5)


## numpy.T


```python
a = np.arange(20).reshape(2,10)
a
```




    array([[ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9],
           [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]])




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


