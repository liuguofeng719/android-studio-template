package ${packageName}.adapter;


import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

import ${packageName}.model.ModelTab;
import ${packageName}.views.fragment.Fragment_Satu;

import java.util.List;

public class ViewPagerAdapter extends FragmentPagerAdapter {
    List<ModelTab> modelTabs;

    public ViewPagerAdapter(FragmentManager fm, List<ModelTab> modelTabs) {
        super(fm);
        this.modelTabs = modelTabs;
    }

    public Fragment getItem(int num) {
        return modelTabs.get(num).getFragment();
    }

    @Override
    public int getCount() {
        return modelTabs.size();
    }

    @Override
    public CharSequence getPageTitle(int position) {
        return modelTabs.get(position).getName();
    }
}