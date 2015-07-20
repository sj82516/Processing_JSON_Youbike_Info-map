import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.geo.*;
import processing.core.*;

public class Station extends SimplePointMarker{
  //字體大小
  protected float size = 15;
  //文字顯示間距
  protected int space = 40;
  //
  protected String sna;
  protected int tot,sbi;
  private PFont font;
  private float fontSize = 12;
  
  public Station(Location location, String _sna, int _tot,int _sbi){
    this.location = location;
    sna = _sna;
    tot = _tot;
    sbi = _sbi;
  }
  //內建函式，定義標記格式內建函式，定義標記格式
  public void draw(PGraphics pg, float x, float y) {
    pg.pushStyle();
    pg.pushMatrix();
    if (selected) {
      pg.translate(0, 0);
    }
    pg.strokeWeight(strokeWeight);
    if (selected) {
      pg.fill(highlightColor);
      pg.stroke(highlightStrokeColor);
    } else {
      pg.fill(25);
      pg.stroke(strokeColor);
    }
    pg.ellipse(x, y, size, size);// TODO use radius in km and convert to px

    //滑鼠出現在地點上，顯示設定的標籤
    if (selected && sna != null) {
      pg.fill(highlightColor);
      pg.stroke(highlightStrokeColor);
      pg.rect(x + strokeWeight / 2, y  + strokeWeight / 2 - space, pg.textWidth(sna) + space * 1.5f, space);
      pg.fill(255, 255, 255);
      pg.text(sna, Math.round(x + space * 0.75f + strokeWeight / 2),Math.round(y + strokeWeight / 2 - space * 0.4f));
    }
    pg.popMatrix();
    pg.popStyle();
  }
}
