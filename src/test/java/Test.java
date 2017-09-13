
public class Test {
    public static void main(String[] args) {
        int m=0;
        for (int a = 1; a <=11 ; a*=2)
            for (int b = 1; b <=a ; b++)
                m++;
        System.out.println(m);
    }
}
