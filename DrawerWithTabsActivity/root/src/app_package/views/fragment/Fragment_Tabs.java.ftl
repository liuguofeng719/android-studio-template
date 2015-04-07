package ${packageName}.views.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.astuetz.PagerSlidingTabStrip;
import ${packageName}.R;
import ${packageName}.adapter.ViewPagerAdapter;
import ${packageName}.model.ModelTab;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;

/**
 * Created by Choirul on 4/6/2015.
 */
public class Fragment_Tabs extends Fragment{

    @InjectView(R.id.tabs)
    PagerSlidingTabStrip tabHost;
    @InjectView(R.id.pager)
    ViewPager pager;

    ViewPagerAdapter adapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        ViewGroup root = (ViewGroup) inflater.inflate(R.layout.fragment_tab, null);
        ButterKnife.inject(this, root);
        initView();
        return root;
    }

    private void initView() {
        List<ModelTab> modelTabs = new ArrayList<>();
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Satu"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Dua"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Tiga"));
        <#if tabsMode == "strip">
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Empat"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Lima"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Enam"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Tujuh"));
        modelTabs.add(new ModelTab(new Fragment_Satu(), "Delapan"));
        </#if>

        adapter = new ViewPagerAdapter(getFragmentManager(), modelTabs);
        pager.setAdapter(adapter);
        tabHost.setViewPager(pager);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        ButterKnife.reset(this);
    }
}