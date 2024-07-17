def add_a_b(p_a:int,p_b:int) -> int:
    print("어서와 add_a_b() 함수는 처음이지")
    return p_a + p_b

class Person:
    def __init__(self,p_name:int,p_age:int) -> None:
        self.name = p_name
        self.age = p_age

    def hello(self) -> None:
        print(f'저의 이름은{self.name}이고, 나이는 {self.age}입니다!')