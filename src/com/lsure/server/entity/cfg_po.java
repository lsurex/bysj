package com.lsure.server.entity;

/**
 * Created by lsure on 2017/4/4.
 */
public class cfg_po {
    private String name;
    private String map;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    @Override
    public String toString() {
        return "cfg_po{" +
                "name='" + name + '\'' +
                ", map='" + map + '\'' +
                '}';
    }
}
