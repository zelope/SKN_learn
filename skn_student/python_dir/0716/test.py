class MyDataset:
    def __init__(self, data:list) -> None:
        self.data = data
        
    # def __call__(self, *args: Any, **kwds: Any) -> Any:
    #     pass
    
    
    def __call__(self, name:str= "python") -> int:
        #객체를 함수처럼 사용하는 것
        #객체를 함수처럼 호출하면 자동으로 적용된다 
        print(f"이름은 {name}입니다")
        
        return len(self.data)
    
    def __getitem__(self, index:int ) -> int:
        print("No pain No gain")
        
        return self.data[index]


if __name__ == "__main__":
    
    db = MyDataset([1,2,3,4,5])
    x = db()
    print(x)
    
    # 이름은 파이썬입니다
    # 5 