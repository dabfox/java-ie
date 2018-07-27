/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cd.bc;

/**
 *
 * @author Marcellin Dbfx
 */
public class Runner {
    
    public static void main(String[] args) {
        //le symbole h est notre but
        String but="b";
        //Base de connaissance que nous allons interrogé
        //à l'aide de l'algorithme de chainage arrière
        //les faits initiaux sont a, c et f
        
            //base des règle
        String baseDeConnaissance="a&c=>d;";
               baseDeConnaissance+="b&d&a=>e;";
               baseDeConnaissance+="e&f&g=>h;";
               baseDeConnaissance+="a&f=>b;";
               baseDeConnaissance+="a&b&f=>i;";
               baseDeConnaissance+="i&f=>g;";
               baseDeConnaissance+="f&g=>b;";
             //base des faits  
               baseDeConnaissance+="a;c;f;";
        
        ChainageArriere ca=new ChainageArriere(but, baseDeConnaissance);
        //execution de l'algorithme de chainage arrière sur la base de connaissance
        String response = ca.execute();
        
        //Affichage de la reponse du moteur d'inférence
        System.out.println("Faits prouvés pour  : "+but);
        System.out.println("--------------------");
        System.out.println(response);
    }
    
}
