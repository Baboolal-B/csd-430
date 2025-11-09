package com.brib.demo;

import java.io.Serializable;

public class DemonSlayerBean implements Serializable {
    private String title;
    private String releaseYear;
    private String focusCharacter;

    public DemonSlayerBean() {}

    public DemonSlayerBean(String title, String releaseYear, String focusCharacter) {
        this.title = title;
        this.releaseYear = releaseYear;
        this.focusCharacter = focusCharacter;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getReleaseYear() { return releaseYear; }
    public void setReleaseYear(String releaseYear) { this.releaseYear = releaseYear; }

    public String getFocusCharacter() { return focusCharacter; }
    public void setFocusCharacter(String focusCharacter) { this.focusCharacter = focusCharacter; }
}
