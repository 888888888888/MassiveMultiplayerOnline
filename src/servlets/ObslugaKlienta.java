package odArtura;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

import javax.imageio.ImageIO;

import mapUtilities.WorldMap2;

public class ObslugaKlienta implements Callable<String>{
	
	private int x;
	private int y;
	private String idGracza;
	private static WorldMap2 mapToPrint = null;
	
	public ObslugaKlienta(int x, int y, String idGracza) {
		this.x = x;
		this.y = y;
		this.idGracza = idGracza;
		
		//Singleton (tworze tylko jeden obiekt mapToPrint na cale dzialanie programu)
		if(mapToPrint == null){
			mapToPrint = new WorldMap2(800, 800);
			mapToPrint.create();
		}
	}

	@Override
	public String call() throws Exception {
		// TODO Auto-generated method stub
		
		MapaCreate mapa = new MapaCreate(x, y, mapToPrint);
		
		//generuje mape do pliku mapa.png
		mapa.generateMap();
		
		return idGracza;
	}
	
//	public static void main(String[] arg){
//		
//		ExecutorService exe = Executors.newFixedThreadPool(10);
//		//y zwiekszanie zchodzi w dol, x w prawo
//		exe.execute(new FutureTask<String>(new ObslugaKlienta(20, 20)));
////		exe.execute(new FutureTask<String>(new ObslugaKlienta(128, 152, "map2.png")));
//	}
	
}
