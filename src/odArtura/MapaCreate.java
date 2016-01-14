package odArtura;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import mapUtilities.WorldMap2;

public class MapaCreate {
	
	WorldMap2 mapToPrint = null;
	int x;
	int y;
	
	public MapaCreate(int x, int y, WorldMap2 mapToPrint) {
		
		this.x = x;
		this.y = y;
		this.mapToPrint = mapToPrint;
	}
	
	public File generateMap() {
		
		File mapa = new File("mapa.png");
		
		BufferedImage bi = new BufferedImage(400, 400, BufferedImage.TYPE_INT_ARGB);

	    Graphics g = bi.createGraphics();
		
	    int height;
        for (int i = 0; i <= 10; i++) {         
            for (int j = 0; j <= 10; j++) {
            	
            	int ix = i*40;
            	int jy = j*40;
            	
            	height = mapToPrint.getMatrix()[ix+x][jy+y].retId();
            	if(height<25&&height>0){
            		g.setColor(new Color(height*10,255,0)); 
            		g.fillRect(ix, jy, 40,40);
            	}else if(height>=25&& height<50){
            		g.setColor(new Color(255,255-(height-25)*10,0)); 
            		g.fillRect(ix, jy, 40,40);
            	}else if(height==50){
            		g.setColor(new Color(255,0,0)); 
            		g.fillRect(ix, jy, 40,40);
            	}else if(mapToPrint.getMatrix()[i][j].retId()==3564){
                	g.setColor(Color.BLUE);
                	g.fillRect(ix, jy, 40,40);
                }else if (mapToPrint.getMatrix()[i][j].retId()==0) {  
                	g.setColor(Color.BLUE); 
                	g.fillRect(ix, jy, 40,40);        
                }else {
                	g.setColor(Color.BLUE); 
                	g.fillRect(ix, jy, 40,40);
                }
            }
        }
        
        try {
			ImageIO.write(bi, "PNG", mapa);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return mapa;
	}

}
