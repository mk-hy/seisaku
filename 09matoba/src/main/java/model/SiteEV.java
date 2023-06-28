package model;

import java.io.Serializable;

public class SiteEV implements Serializable {
	  private int like; // よいねの数

	  public SiteEV() {
	    like = 0;
	  }
	  public int getLike() { return like; }
	  public void setLike(int like) { 
	    this.like = like;
	  }
	}