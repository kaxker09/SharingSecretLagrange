#schema (3,5)

def findP(k,n,M):
    if n > M:
        p = next_prime(n)
    else:
        p = next_prime(M)
    return p
    
def genPolynomialRing(p,M):
    F=GF(p)
    a = randint(1,p-1)
    b = randint(1,p-1)
    P=PolynomialRing(F,'x')
    f=a*x**2+b*x+M
    y=f(x=2)
    print(y)
    return f,F

def genShadow(f):
    o = f(x=1)
    p = f(x=2)
    r = f(x=3)
    s = f(x=4)
    t = f(x=5)
    return o,p,r,s,t

#dla k=1,3,5
def calcM(F,o,r,t):
    A=matrix(F,[[1,1,1],[3**2,3,1],[5**2,5,1]])
    B=vector(F,[o,r,t])
    Ainv = A.inverse()
    X=Ainv*B
    
    print(A)
    print(B)
    print(X)
    
    M = X[2]
    print(M)
    return M
 
def checkM(M,m):
    if m == M:
        print("Success")
    else:
        print("error")

def main():
    k = 3
    n = 5
    M = 11
    p = findP(k,n,M)
    print(p)
    f,F = genPolynomialRing(p,M)
    print(f)
    o,p,r,s,t = genShadow(f)
    m = calcM(F,o,r,t)
    checkM(m,M)
   
if __name__=="__main__":
    main()
        
