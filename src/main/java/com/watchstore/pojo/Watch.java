package com.watchstore.pojo;

public class Watch
{
	private int watchId;
	private String watchTitle,watchDescription;
	
	public Watch(String watchTitle, String watchDescription) {
		super();
		this.watchTitle = watchTitle;
		this.watchDescription = watchDescription;
	}

	public Watch(int watchId, String watchTitle, String watchDescription) {
		super();
		this.watchId = watchId;
		this.watchTitle = watchTitle;
		this.watchDescription = watchDescription;
	}

	public int getWatchId() {
		return watchId;
	}

	public void setWatchId(int watchId) {
		this.watchId = watchId;
	}

	public String getWatchTitle() {
		return watchTitle;
	}

	public void setWatchTitle(String watchTitle) {
		this.watchTitle = watchTitle;
	}

	public String getWatchDescription() {
		return watchDescription;
	}

	public void setWatchDescription(String watchDescription) {
		this.watchDescription = watchDescription;
	}
	
	
}
