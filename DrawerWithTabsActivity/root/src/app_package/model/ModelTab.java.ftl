package ${packageName}.model;


import android.support.v4.app.Fragment;

/**
 * Created by Choirul on 4/7/2015.
 */
public class ModelTab {

    private Fragment fragment;
    private String name;

    public ModelTab(Fragment fragment, String name) {
        this.fragment = fragment;
        this.name = name;
    }

    public Fragment getFragment() {
        return fragment;
    }

    public void setFragment(Fragment fragment) {
        this.fragment = fragment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
