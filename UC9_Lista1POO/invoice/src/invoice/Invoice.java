package invoice;

public class Invoice {

    int numeroDoItem;
    String descricaoDoItem;
    int quantidadeDoItem;
    double precoDoItem;

    public Invoice(int numeroDoItem, String descricaoDoItem, int quantidadeDoItem, double precoDoItem) {
        this.numeroDoItem = numeroDoItem;
        this.descricaoDoItem = descricaoDoItem;
        this.quantidadeDoItem = quantidadeDoItem;
        this.precoDoItem = precoDoItem;

        if (quantidadeDoItem < 0) {
            this.quantidadeDoItem = 0;

        }
        if (precoDoItem < 0) {
            this.precoDoItem = 0.0;
        }
    }

    public int getNumeroDoItem() {
        return numeroDoItem;
    }

    public void setNumeroDoItem(int numeroDoItem) {
        this.numeroDoItem = numeroDoItem;
    }

    public String getDescricaoDoItem() {
        return descricaoDoItem;
    }

    public void setDescricaoDoItem(String descricaoDoItem) {
        this.descricaoDoItem = descricaoDoItem;
    }

    public int getQuantidadeDoItem() {
        return quantidadeDoItem;
    }

    public void setQuantidadeDoItem(int quantidadeDoItem) {
        this.quantidadeDoItem = quantidadeDoItem;
    }

    public double getPrecoDoItem() {
        return precoDoItem;
    }

    public void setPrecoDoItem(double precoDoItem) {
        this.precoDoItem = precoDoItem;
    }
    
    public double calcularValorFatura(){
       double valorFatura = this.quantidadeDoItem * this.precoDoItem;
       
       return valorFatura;
    }
     
    public void exibir(){
        System.out.println("Item: " + getDescricaoDoItem());
        System.out.println("nrItem: " + getNumeroDoItem());
        System.out.println("Preco Item: " + getPrecoDoItem());
        System.out.println("Quantidade item: " + getQuantidadeDoItem());
    }


    public static void main(String[] args) {
        Invoice compras = new Invoice(9, "Teste", 2, 15.50);
        
        compras.exibir();
        
        System.out.println("O valor total é de: R$ " + compras.calcularValorFatura());
        
    }

}

