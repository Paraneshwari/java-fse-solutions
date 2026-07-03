import java.util.Arrays;
import java.util.Comparator;

public class Main {

    public static void main(String[] args) {

        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Phone", "Electronics"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Bag", "Fashion")
        };

        System.out.println("----- Linear Search -----");

        Product p1 = SearchAlgorithms.linearSearch(products, "Phone");

        if (p1 != null)
            p1.display();
        else
            System.out.println("Product not found");

        // Sort array for Binary Search
        Arrays.sort(products, Comparator.comparing(product -> product.productName));

        System.out.println("\n----- Binary Search -----");

        Product p2 = SearchAlgorithms.binarySearch(products, "Phone");

        if (p2 != null)
            p2.display();
        else
            System.out.println("Product not found");
    }
}