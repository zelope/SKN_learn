import enum
class SUBJECT(enum.Enum):
        KOR = (enum.auto(), "국어")
        MATH = (enum.auto(), "수학")
        ENG = (enum.auto(), "영어")
        
def sub_in_enum(subject_n):
    for item in SUBJECT:
        if  subject_n == item.value[1]:
            return subject_n
            
    else:
        raise ValueError(f"{subject_n} is wrong subject")
    

def avg_of_subjects(**kwargs) :
    result = {}
    for subject in kwargs.keys():
        try: 
            subject = sub_in_enum(subject)
        except ValueError as e:
            print(e)
            
        else:
            result[subject] = sum(kwargs[subject]) / len(kwargs[subject])
            return result


if __name__ == "__main__":
    
    
    sub_score = {'과학' : [10, 20 ,30], '국어' : [10, 20 ,30]}
    print(avg_of_subjects(**sub_score))