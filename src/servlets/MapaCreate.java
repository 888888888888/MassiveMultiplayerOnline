package servlets;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import mapObjects.Tree;
import mapUtilities.WorldMap2;

public class MapaCreate {
	private String graphLocation = "..\\grafiki";
	WorldMap2 mapToPrint = null;
	int x; //zawsze 20
	int y; //20
	
	public MapaCreate(int x, int y, WorldMap2 mapToPrint) {
		this.x = x;//x;
		this.y = y;//y;
		this.mapToPrint = mapToPrint;
	}
	
	public File generateMap() throws IOException {
		
		File mapa = new File("mapa.png"); //plik do ktorego zostanie zapisana mapa
		BufferedImage bi = new BufferedImage(500, 500, BufferedImage.TYPE_INT_ARGB); //canvas na którym pracuje
	    Graphics g = bi.createGraphics();//tworze obiekt na którym mo¿na rysowaæ
	    int height; // wysokoœæ
        for (int dx = 0; dx <= 50; dx++) {
            for (int dy = 0; dy <= 50; dy++) {
            	int ix = dx*50;
            	int jy = dy*50;
            	
            	height = mapToPrint.getMatrix()[dx+x][dy+y].retCoord().retZ(); //pobieram wysokosc komorki
            	//if(height<25&&height>0){
            	if(height<17&&height>0){
            		BufferedImage image = ImageIO.read(new File(graphLocation+"\\113.png"));
            		g.drawImage(image, ix, jy, null);
            		chooseGraph(dx, dy, g);
            		//g.setColor(new Color(height*10,255,0)); 
            		//g.fillRect(ix, jy, 40,40);
            	}else if(height>=17){
            		BufferedImage image = ImageIO.read(new File(graphLocation+"\\213.png"));
            		g.drawImage(image, ix, jy, null);
            		chooseGraph(dx, dy, g);
            	}else if(height==50){
            		g.setColor(new Color(255,0,0)); 
            		g.fillRect(ix, jy, 50,50);
            	}else if(mapToPrint.getMatrix()[dx][dy].retId()==3564){
                	g.setColor(Color.BLUE);
                	g.fillRect(ix, jy, 50,50);
                }else if (mapToPrint.getMatrix()[dx][dy].retId()==0) {  
                	g.setColor(Color.BLUE); 
                	g.fillRect(ix, jy, 50,50);        
                }else {
                	g.setColor(Color.BLUE); 
                	g.fillRect(ix, jy, 50,50);
                }
            	Random random = new Random();
            	if(mapToPrint.getMatrix()[dx+x][dy+y].getAllObjects().contains(new Tree(89,3))){
            		BufferedImage image = ImageIO.read(new File(graphLocation+"\\30"+random.nextInt(8)+".png"));
            		g.drawImage(image, ix, jy, null);
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
	
	public int checkHeight(int dx, int dy){
		if(mapToPrint.getMatrix()[dx][dy].retCoord().retZ()>=17)
		return 2;
		else return 1;
	}
	public void chooseGraph(int i,int j,Graphics g){
		File file;
		if(mapToPrint.getMatrix()[x+i][y+j-1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"01.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i+1][y+j].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"02.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(mapToPrint.getMatrix()[x+i+1][y+j+1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"03.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i-1][y+j].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"04.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i-1][y+j-1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"09.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i+1][y+j-1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"10.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i+1][y+j+1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"11.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(mapToPrint.getMatrix()[x+i-1][y+j+1].retCoord().retZ() > mapToPrint.getMatrix()[x+i][y+j].retCoord().retZ()){
			try {
				BufferedImage image =ImageIO.read(new File(graphLocation+"\\"+checkHeight(x+i,y+j)+"12.png"));
				g.drawImage(image,i*50,j*50,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
//	public static void main(String []args) throws IOException{
//		WorldMap2 map = new WorldMap2(100,100);
//		map.create();
//		MapaCreate mapa = new MapaCreate(30,30,map);
//		mapa.generateMap();
//		
//	}
}
